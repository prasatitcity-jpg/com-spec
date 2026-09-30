# CARTOON PC POS & SMART CUSTOM PC BUILDER
### ระบบจัดสเปคคอมตามงบ | แดชบอร์ดความนิยมรายสัปดาห์ | ระบบ POS หน้าร้าน | เชื่อมต่อ Supabase & Vercel

ระบบเว็บแอปพลิเคชันสำหรับร้านคอมพิวเตอร์และการจัดสเปคคอมพิวเตอร์ครบวงจร พัฒนาด้วย **Next.js 14+ (App Router)**, **TypeScript**, **Tailwind CSS**, และ **Supabase** พร้อมรองรับการ Deploy สู่ **Vercel** ทันที

---

## 🚀 ฟีเจอร์หลัก (Key Features)

### 1. ระบบจัดสเปคคอมตามงบประมาณ (Smart Custom PC Builder)
- **ปรับงบประมาณอิสระ**: มีปุ่มลัดงบ (18,000 / 28,000 / 38,000 / 55,000 / 75,000+ บาท) และสไลเดอร์ปรับละเอียด
- **เลือกลักษณะการใช้งาน**: เล่นเกม (Gaming), ตัดต่อ/สตรีม (Workstation), สำนักงาน (Office), ปัญญาประดิษฐ์ (AI & Data Science)
- **ระบบจัดสเปค AI อัจฉริยะ**: คำนวณความสมดุลของอุปกรณ์ ไม่ให้เกิดคอขวด (Bottleneck)
- **เปลี่ยนและเปรียบเทียบชิ้นส่วนย่อย (Component Swap & Comparison)**:
  - มีรูปภาพคมชัดของอุปกรณ์ทุกชิ้น พร้อมสเปกและราคา
  - แสดงส่วนต่างราคาแบบ Real-time (`+฿1,200` หรือ `-฿500`)
  - คำนวณอัตราการกินไฟ (Wattage) และแนะนำขนาดพาวเวอร์ซัพพลาย (PSU) ที่เหมาะสม
- **พิมพ์ใบเสนอราคา (Quotation Print)**: พิมพ์ออกกระดาษหรือบันทึกเป็น PDF สวยงาม

### 2. ระบบแดชบอร์ดความนิยมรายอาทิตย์ (Weekly Trending Analytics)
- **5 สเปคยอดฮิตประจำสัปดาห์**: แสดงชื่อสเปค, งบประมาณ, สถิติจำนวนคนดู, และยอดขายจริงหน้าร้าน พร้อมปุ่มคลิก "ใช้สเปคนี้" นำไปจัดต่อได้ทันที
- **กราฟสัดส่วนช่วงงบประมาณ**: แสดงสถิติเปอร์เซ็นต์งบที่ลูกค้าเลือกจัดมากที่สุด (15k-25k, 25k-40k, 40k-60k, 60k+)
- **ชิ้นส่วนฮาร์ดแวร์ยอดนิยม**: จัดอันดับ Top CPU, Top GPU, Top SSD, Top RAM ประจำสัปดาห์

### 3. ระบบ POS หน้าร้าน & ออกใบเสร็จ (Point of Sale & Receipt Printer)
- ส่งรายการสเปคคอมที่จัดเสร็จเข้าสู่ระบบ POS ทันที
- **ระบบสมาชิกและส่วนลด**: สมาชิกระดับ Standard (0%), Silver (3%), Gold (5%), Platinum (10%) หักส่วนลดอัตโนมัติ
- **ระบบชำระเงินหลากหลาย**:
  - พร้อมเพย์ (PromptPay QR Code)
  - เงินสด (Cash) พร้อมระบบคำนวณเงินทอนอัตโนมัติ
  - บัตรเครดิต (Credit Card)
- **พิมพ์ใบสั่งประกอบ / ใบเสร็จรับเงิน**: ระบุเลขที่บิล วันที่ ชื่อลูกค้า รายการชิ้นส่วน รับประกัน 3 ปี และบริการประกอบฟรี

### 4. ระบบแอดมิน & บันทึกการเข้าใช้งานของลูกค้า (Admin & Customer Activity Logs)
- **จัดการสินค้า (Product CRUD)**: เพิ่มชิ้นส่วนใหม่, แก้ไขราคา, ปรับปรุงสต็อกสินค้า, เปลี่ยนรูปภาพ
- **บันทึกการเข้าใช้งาน (Activity Logs)**: บันทึกวัน-เวลา, ชื่อลูกค้า/Guest, การกระทำ (จัดสเปค, เปลี่ยนชิ้นส่วน, ชำระเงิน), อุปกรณ์ที่ใช้ (Mobile/Desktop), และหน้าเว็บที่เข้าชม
- **ประวัติการขาย (POS Orders)**: ตรวจสอบประวัติบิลย้อนหลัง

### 5. ใช้งานผ่านมือถือได้ 100% (Mobile-Responsive Design)
- ออกแบบโทน **Dark Tech / Cyber Gaming** ทันสมัย
- รองรับขนาดหน้าจอสมาร์ทโฟน มี Bottom Navigation แถบด้านล่างเข้าถึงทุกเมนูสะดวก

---

## 🛠️ โครงสร้างฐานข้อมูล Supabase (Database Schema)

ไฟล์ SQL สำหรับสร้างตารางทั้งหมดอยู่ใน [`supabase-schema.sql`](file:///c:/Users/Admin/Downloads/cartoon/supabase-schema.sql) ประกอบด้วย:
1. `products` (ตารางอุปกรณ์ฮาร์ดแวร์คอมพิวเตอร์และราคา)
2. `members` (ตารางสมาชิกและระดับ Tier ส่วนลด)
3. `orders` (ตารางคำสั่งซื้อและใบเสร็จ POS)
4. `customer_logs` (ตารางบันทึกประวัติการเข้าใช้งานและกิจกรรมของลูกค้า)
5. `saved_builds` (ตารางบันทึกสเปคคอมพิวเตอร์ที่จัดไว้)

### วิธีเชื่อมต่อ Supabase:
1. ไปที่ [Supabase](https://supabase.com) แล้วสร้างโปรเจกต์ใหม่
2. ไปที่เมนู **SQL Editor** -> **New Query** แล้ว Copy โค้ดจากไฟล์ `supabase-schema.sql` ไปวางแล้วกด **Run**
3. ไปที่ **Project Settings** -> **API** แล้วคัดลอก `Project URL` และ `anon key`
4. นำไปใส่ในไฟล์ `.env.local`:
```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
```
*(หากยังไม่ได้เชื่อมต่อ Supabase ระบบจะทำงานในโหมด Offline / Persistent Mock Data ให้ทดสอบใช้งานได้ 100% ทันที)*

---

## 🌐 การ Deploy บน Vercel

1. Push โค้ดโปรเจกต์ขึ้น GitHub / GitLab / Bitbucket
2. ล็อกอินเข้าสู่ [Vercel](https://vercel.com)
3. กด **Add New Project** แล้ว Import Repository นี้
4. ในส่วน **Environment Variables** ให้เพิ่ม:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
5. กด **Deploy** เว็บไซต์จะออนไลน์พร้อมใช้งานทันที

---

## 💻 วิธีรันบนเครื่อง Local

```bash
# ติดตั้ง dependencies
npm install

# รัน Development Server
npm run dev

# เปิดเบราว์เซอร์ที่
http://localhost:3000
```
