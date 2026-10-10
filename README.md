# Nada - Marriage Connections App

Welcome to the **Nada** Flutter take-home assignment repository! This application helps families discover marriage connections through people they already know[cite: 1], built with **Flutter** and **Riverpod**.

---

## 📂 Project Overview & Features

* **Screen One (Profile List)**: Displays all 24 profiles[cite: 1] with a responsive search bar filtering by name and city (case-insensitive). Features interactive state toggle pills for testing **Loading**, **Empty** (`"No profiles match"`), and **Error** states with a working **Retry** button.
* **Screen Two (Profile Details)**: Tapping any profile opens a comprehensive detail view displaying all available attributes, highlighting the `connected_through` network path in a dedicated card, and gracefully handling missing or null fields (including full Hindi text rendering for profile #16[cite: 1]).
* **State Management**: Built using **Flutter Riverpod**[cite: 2], separating business logic and data repositories cleanly from the UI presentation layer.

---

## 🚀 1. How to Run the App on an Android Emulator or iOS Simulator

### Prerequisites
* Flutter SDK (`>=3.0.0`)
* Dart SDK
* An active **Android Emulator** or **iOS Simulator** (or Chrome browser)

### Steps to Run
1. **Clone the repository and navigate into the folder:**
   ```bash
   git clone [https://github.com/your-username/nada-app.git](https://github.com/your-username/nada-app.git)
   cd nada-app
