---

````markdown
# 📱 Student Management System - Flutter Student App

This Flutter app is the **student-side** of a full-stack Student Management System. It allows students to log in, view their academic results, receive notifications, access educational resources, and engage in student communities.

> The backend is powered by **Node.js (Express.js)** and **PostgreSQL**, while admin and teacher dashboards are built with **React.js**.

---

## 🚀 Features

✅ Login & Authentication  
✅ Student Profile Management  
✅ View Course Results (Year/Semester Based)  
✅ Notification System  
✅ Report Issues to Teachers  
✅ Access Educational Resources  
✅ Student Community (Post & View Thoughts)

---

## 🛠️ Built With

- **Flutter** – Frontend Framework (Mobile)
- **Dart** – Language
- **Provider** – State Management
- **HTTP** – API Requests
- **Shared Preferences** – Local Storage (for login token)
- **Node.js / Express** – Backend (API)
- **PostgreSQL** – Database

---

## 📂 Project Structure

```bash
lib/
├── main.dart                # Entry point
├── pages/                # Pages (Login, Home, Results, etc.)
│   ├── login_page.dart
│   ├── home_page.dart
│   ├── profile_page.dart
│   └── ...
├── widgets/                # Reusable UI components
├── models/                 # Data models (Student, Result, etc.)
├── services/               # API and data handling
├── providers/              # State management (auth, user, etc.)
└── utils/                  # Helper functions, constants, etc.
````

## 🔐 Authentication Flow

* Students log in using email and password
* Token received from **Node.js backend (JWT)**
* Token is stored using `shared_preferences`
* All API requests include the token in headers

---

## 📡 API Integration (Node.js Backend)

* Login: `POST /api/auth/login`
* Get Profile: `GET /api/student/profile`
* Get Results: `GET /api/student/results`
* Post Issue: `POST /api/student/issues`
* Get Notifications: `GET /api/student/notifications`

*(APIs secured with JWT Auth and role-based access control)*

---

## 📦 Packages Used

| Package                  | Purpose                          |
| ------------------------ | -------------------------------- |
| `provider`               | State management                 |
| `http`                   | API requests                     |
| `shared_preferences`     | Store login token                |
| `fluttertoast`           | Toast messages                   |
| `flutter_secure_storage` | (Optional) Secure token storage  |
| `fl_chart`               | Graphs for results visualization |

---

## 🧪 How to Run

1. Clone this repo:

   ```bash
   git clone https://github.com/your-username/student-app.git
   cd student-app
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

## 👨‍🎓 Project Overview

This project is a role-based Student Management System with the following components:

| Role     | Platform      | Stack                           |
| -------- | ------------- | ------------------------------- |
| Student  | Flutter App   | Flutter + Node.js + PostgreSQL  |
| Teacher  | Web Dashboard | React.js + Node.js + PostgreSQL |
| Director | Web Dashboard | React.js + Node.js + PostgreSQL |

---


## 🧑‍💻 Author

Wubishet Wudu – [LinkedIn](https://linkedin.com/in/wubishet-wudu)
Student, Bahir Dar University | Flutter & Fullstack Developer

---
