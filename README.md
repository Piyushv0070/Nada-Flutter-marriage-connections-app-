# Nada - Marriage Connections App

Welcome to **Nada**! This application helps families discover marriage connections through people they already know, featuring a clean two-screen interface built with **Flutter** and **Riverpod**.

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

## 🌟 Features Overview & Review Checklist

* **Screen One (Profile List)**:
  * Displays all 24 profiles with real-time case-insensitive search filtering by name and city.
  * Robust state handling for **Loading** (`CircularProgressIndicator`), **Empty** (`"No profiles match"`), and **Error** states with a **Retry** button.
* **Screen Two (Profile Details)**:
  * Comprehensive detail view displaying all available attributes.
  * Prominent network connection section highlighting the `connected_through` connection path.
  * Gracefully handles missing and `null` fields (e.g., `degree: null`, `about: null`, `connected_through: null`).
  * Unicode & Devanagari text support (e.g., Hindi text in Profile #16 - Aditya Tiwari).
* **State Management & Architecture**:
  * Clean separation of concerns with **Riverpod** (`FutureProvider` & `StateProvider`).
  * Business logic and data repositories are completely decoupled from UI rendering widgets.

---

## 📱 1. How to Run the App on an Android Emulator or iOS Simulator

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>=3.0.0`)
* Dart SDK
* Android Studio (with an Android Virtual Device / AVD configured) or Xcode (with iOS Simulator)

### Steps to Launch on Android Emulator or iOS Simulator

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Piyushv0070/Nada-Flutter-marriage-connections-app-.git
   cd Nada-Flutter-marriage-connections-app-
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **List available devices / emulators:**
   ```bash
   flutter devices
   # or
   flutter emulators
   ```

4. **Launch an Emulator / Simulator:**
   * **Android**: Launch your AVD from Android Studio Device Manager, or run:
     ```bash
     flutter emulators --launch <emulator_id>
     ```
   * **iOS (macOS only)**: Launch simulator with:
     ```bash
     open -a Simulator
     ```

5. **Run the application:**
   ```bash
   flutter run
   ```

---

## 🧪 2. How to Run the Widget Test

The project includes automated widget tests in `test/widget_test.dart` that verify profile listing, search filtering by city, and empty state rendering.

### Running Tests

Execute the following command in the project root:

```bash
flutter test
```

Or target the specific widget test file directly:

```bash
flutter test test/widget_test.dart
```

**Expected Output**:
```text
00:09 +1: All tests passed!
```

---

## 🔮 3. What I Would Do Next With More Time

Given additional development time, I would build the following enhancements:

1. **Interactive Connection Graph Visualizer**:
   * Build a visual node-link diagram or family tree visualizer for degrees of connection (`1st degree`, `2nd degree`, `3rd degree`) to visually map out connection paths.

2. **Advanced Multi-Filter Chips**:
   * Add filter chips allowing users to narrow down profiles simultaneously by Community, Profession, Age Range, Gender, and Degree of Connection.

3. **Offline Caching & Local Persistence**:
   * Implement local storage using **Hive** or **Sqflite** so previously loaded profiles remain accessible offline without network requests.

4. **Deep Linking & Profile Sharing**:
   * Add deep link routes (e.g. `/profile/16`) to allow sharing specific marriage profiles directly via WhatsApp, SMS, or email.

5. **Favorites & Shortlisting**:
   * Allow families to shortlist/favorite profiles and add private family notes for each profile.

6. **Expanded Test Coverage**:
   * Add Golden Tests for visual regression testing across different screen sizes and dark/light themes.

---

## 🤖 4. AI Tools Used

In accordance with workplace practices and disclosure guidelines, the following AI tools were utilized during development:

* **Google Gemini**: Used for initial boilerplate scaffolding, formatting the raw 24-profile JSON dataset into Dart models, verifying Riverpod state overrides in unit tests, and configuring font fallbacks for Devanagari text.
* **Google Stitch**: Used for UI layout generation, component design references, and styling structure.

---

## 🛠️ Architecture & Tech Stack

* **Framework**: [Flutter](https://flutter.dev/) (Material Design 3)
* **Language**: [Dart](https://dart.dev/)
* **State Management**: [Flutter Riverpod](https://riverpod.dev/) (`2.6.1`)
* **Network & Fonts**: `http`, `google_fonts`
