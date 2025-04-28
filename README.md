
# 📱 Flutter Technical Task – تمويلي

This is a simple **Financial Services App** built with **Flutter**. It allows users to browse products, submit complaints, and contact the company. The app features multi-language support (English & Arabic), form validations, smooth navigation, and follows Clean Architecture with Bloc (Cubit) for state management.

---

## 🚀 Features

### 🏠 Main Screen
- Company **Logo Placeholder** at the top.
- Four main options in a horizontal layout:
  - **Contact Us**
  - **Our Products**
  - **Submit Complaint**
  - **About the Company**
- Each button navigates to its respective screen.

### 📞 Contact Us Screen
- Displays company **phone number** and **email**.
- Includes a **contact form**:
  - Name
  - Phone
  - Message
- Optional Integration: **WhatsApp** or **Email Intent**.

### 🛍 Our Products Screen
- Lists **financial products** with:
  - Product Title
  - Description
  - "More" Button
- Fully **responsive design** across all screen sizes.

### 📝 Submit Complaint Screen
- Complaint form fields:
  - Name
  - Phone
  - Complaint Type (Dropdown)
  - Details
- Includes **form validation** and **error handling**.

### 🏢 About the Company Screen
- Displays:
  - Company Overview
  - Mission
  - Vision
- Optional: Embedded **Google Maps** or static company location.

---

## 🧰 Technical Stack

- **Flutter** (stable)
- **Cubit** from flutter_bloc (for state management)
- **dio** (for mocked API or local dummy data)
- **Hive** (optional: for caching form/product data)
- **Clean Architecture** principles
- Fully **responsive** and **multi-language** (LTR & RTL support)

---

## 🌐 Mocked API or Local Data

Since no real API is provided, dummy local JSON or mocked API integration is used to simulate network calls, loading states, and error states.

---

## 📹 Demo (Video)
🎥 [Watch Demo] https://drive.google.com/file/d/13g5yViCMVhzITqSzEHLKJs4E2W2aqgFB/view?usp=drive_link

---

## 📦 Demo (APK)
📱 [Download APK] https://drive.google.com/file/d/1b9AulkADuwITad2-JsKD9vSj7fm9HLnH/view?usp=drive_link

---

## 🛠 How to Run

1. Clone this repo:
   ```bash
   git clone https://github.com/devmuhammadreda/financial_services_app.git
   cd financial_services_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## ✨ Notes

- Fully RTL and LTR layout support based on language selection.
- Proper form validations with meaningful error messages.
- Modern UI adhering to the provided design mockups.
- Pagination logic applied if needed (for products listing).
- Organized and modular folder structure.

---

## ✅ Evaluation Criteria Addressed

- ✅ Functional completeness
- ✅ Clean Architecture + Bloc/Cubit
- ✅ Responsive UI/UX
- ✅ Error handling
- ✅ Local storage (optional bonus)
- ✅ Smooth simple animations

---

## 📧 Submission

- GitHub repo: https://github.com/devmuhammadreda/financial_services_app.git
- Email:  devmuhammadreda@gmail.com

---

Would you like me to also prepare a **version with fake demo links inserted** so it's fully ready before you send me the real ones? 🚀  
(That way you can just replace them easily!)