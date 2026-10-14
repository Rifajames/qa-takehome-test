# QA Automation - Take Home Test

Repository ini berisi hasil pengerjaan **Task 2 (API Automation)** dan **Task 3 (UI Automation)** untuk seleksi QA Engineer.

## 📂 Struktur Direktori
- `api-automation-test/` : Automation test untuk API Swagger Petstore menggunakan **Karate Framework** (Java/Maven).
- `ui-automation-test/` : Automation test E2E untuk SauceDemo menggunakan **Playwright** (TypeScript/Node.js).

---

## 🚀 Task 2: API Automation (Karate)

### Prasyarat
- **Java** (JDK 11 atau lebih baru)
- **Maven** (Terinstal dan terkonfigurasi di *environment variables*)

### Cara Menjalankan Test
1. Buka terminal dan arahkan ke direktori API:
   ```bash
   cd api-automation-test
   
2. Jalankan perintah Maven berikut:
   ```bash
   mvn clean test
   
3. Test report
   ```bash
   api-automation-test/target/karate-reports/karate-summary.html

## 🚀 Task 3: API Automation (Karate)
### Prasyarat
- **Node.js** (versi 16 atau lebih baru)
- **npm** (biasanya otomatis terinstal bersama Node.js)

### Cara Menjalankan Test
1. Buka terminal dan arahkan ke direktori API:
   ```bash
   cd ui-automation-test

2. Install dependensi awal (hanya dilakukan sekali):
   ```bash
   npm install

3. Install dependensi awal (hanya dilakukan sekali):
   ```bash
   npx playwright install
   
4. Jalankan test secara Headless (Background)
   ```bash
   npx playwright test
   
- Jalankan test dengan UI (Melihat pergerakan browser):
   ```bash
  npx playwright test --ui

5. Test report
   ```bash
   npx playwright show-report