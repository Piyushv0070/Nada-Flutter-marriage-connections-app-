# Nada - Marriage Connections App

Welcome to the **Nada** Flutter repository! This application helps families discover marriage connections through people they already know, using a clean two-screen interface built with **Flutter** and **Riverpod**.

---

## 📂 Project Overview & Features

* **Screen One (Profile List)**:
  * Displays all 24 profiles with a search bar filtering by name and city (case-insensitive).
  * Handles loading, empty (`"No profiles match"`), and error states with a retry button.
* **Screen Two (Profile Details)**:
  * Tapping any profile opens a detail view displaying all available attributes.
  * Highlights the `connected_through` network path in a dedicated card.
  * Gracefully handles missing or null fields, including full Hindi text rendering for profile #16 (Aditya Tiwari).
* **State Management**:
  * Built using **Flutter Riverpod**, separating business logic and repositories from the UI presentation layer.

---

## 📂 Project Structure

```text
nada_app/
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── profile.dart
│   ├── repositories/
│   │   └── profile_repository.dart
│   ├── providers/
│   │   └── profile_provider.dart
│   └── screens/
│       ├── profile_list_screen.dart
│       └── profile_detail_screen.dart
└── test/
    └── widget_test.dart
```

---

## 🚀 How to Run the App

### Prerequisites
* Flutter SDK (`>=3.0.0`)
* Dart SDK
* An active **Android Emulator**, **iOS Simulator**, or **Chrome Browser**

### Steps to Run

1. **Clone the repository and navigate into the project directory:**
   ```bash
   git clone https://github.com/Piyushv0070/Nada-Flutter-marriage-connections-app-.git
   cd Nada-Flutter-marriage-connections-app-
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

4. **Run widget tests:**
   ```bash
   flutter test
   ```

---

## 🛠️ Architecture & Tech Stack

* **Framework**: [Flutter](https://flutter.dev/)
* **Language**: [Dart](https://dart.dev/)
* **State Management**: [Riverpod](https://riverpod.dev/)
* **Design System**: Material Design 3
