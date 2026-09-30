-- =====================================================================
-- SUPABASE DATABASE SCHEMA FOR CARTOON PC BUILDER & POS SYSTEM
-- Run this script in the Supabase SQL Editor (SQL Editor -> New Query -> Run)
-- =====================================================================

-- 1. Create table for Products / PC Hardware Components
CREATE TABLE IF NOT EXISTS public.products (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  brand TEXT NOT NULL,
  price NUMERIC(10, 2) NOT NULL DEFAULT 0,
  image TEXT,
  specs JSONB DEFAULT '{}'::jsonb,
  wattage INTEGER DEFAULT 0,
  stock INTEGER DEFAULT 0,
  popular_score INTEGER DEFAULT 50,
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Create table for Members / Customers
CREATE TABLE IF NOT EXISTS public.members (
  id TEXT PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  phone TEXT,
  role TEXT DEFAULT 'customer' CHECK (role IN ('customer', 'admin', 'staff')),
  tier TEXT DEFAULT 'Standard' CHECK (tier IN ('Standard', 'Silver', 'Gold', 'Platinum')),
  discount_percent NUMERIC(5, 2) DEFAULT 0,
  points INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 3. Create table for POS Orders / Invoices
CREATE TABLE IF NOT EXISTS public.orders (
  id TEXT PRIMARY KEY,
  order_number TEXT UNIQUE NOT NULL,
  customer_name TEXT NOT NULL,
  customer_phone TEXT,
  member_id TEXT REFERENCES public.members(id) ON DELETE SET NULL,
  member_tier TEXT,
  items JSONB NOT NULL DEFAULT '[]'::jsonb,
  subtotal NUMERIC(10, 2) NOT NULL,
  discount NUMERIC(10, 2) DEFAULT 0,
  total NUMERIC(10, 2) NOT NULL,
  payment_method TEXT NOT NULL CHECK (payment_method IN ('cash', 'promptpay', 'credit_card')),
  status TEXT DEFAULT 'completed' CHECK (status IN ('completed', 'processing', 'cancelled')),
  cashier_name TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 4. Create table for Customer Logs & Activity Tracking
CREATE TABLE IF NOT EXISTS public.customer_logs (
  id TEXT PRIMARY KEY,
  member_id TEXT REFERENCES public.members(id) ON DELETE SET NULL,
  customer_name TEXT NOT NULL,
  action TEXT NOT NULL,
  details TEXT,
  path TEXT,
  device_type TEXT DEFAULT 'Desktop',
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 5. Create table for Saved PC Builds
CREATE TABLE IF NOT EXISTS public.saved_builds (
  id TEXT PRIMARY KEY,
  member_id TEXT REFERENCES public.members(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  total_price NUMERIC(10, 2) NOT NULL,
  total_wattage INTEGER DEFAULT 0,
  components JSONB NOT NULL DEFAULT '{}'::jsonb,
  target_budget NUMERIC(10, 2),
  target_usage TEXT,
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Row Level Security (RLS) policies
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.members ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.customer_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.saved_builds ENABLE ROW LEVEL SECURITY;

-- Allow public read & write for POS and Builder operation (adjust with Auth if strict)
CREATE POLICY "Allow public read products" ON public.products FOR SELECT USING (true);
CREATE POLICY "Allow public insert/update products" ON public.products FOR ALL USING (true);

CREATE POLICY "Allow public read members" ON public.members FOR SELECT USING (true);
CREATE POLICY "Allow public insert/update members" ON public.members FOR ALL USING (true);

CREATE POLICY "Allow public read orders" ON public.orders FOR SELECT USING (true);
CREATE POLICY "Allow public insert orders" ON public.orders FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public read customer_logs" ON public.customer_logs FOR SELECT USING (true);
CREATE POLICY "Allow public insert customer_logs" ON public.customer_logs FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public read saved_builds" ON public.saved_builds FOR SELECT USING (true);
CREATE POLICY "Allow public insert saved_builds" ON public.saved_builds FOR INSERT WITH CHECK (true);

-- Seed initial test member & admin
INSERT INTO public.members (id, email, name, phone, role, tier, discount_percent, points)
VALUES 
  ('mem-1', 'somchai.game@gmail.com', 'สมชาย รักการเล่นเกม', '081-234-5678', 'customer', 'Gold', 5.0, 1250),
  ('admin-1', 'admin@cartoonthepc.com', 'แอดมิน ชัยวัฒน์ (POS Manager)', '085-555-9999', 'admin', 'Platinum', 10.0, 9999)
ON CONFLICT (id) DO NOTHING;
