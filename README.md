#Flutter Savings App

A simple savings management app built using Flutter with MVVM Architecture and Bloc State Management. It allows users to add savings, withdraw funds, and view transaction history.

#📌 Features
✔ Add savings (divided into CompA & CompB)
✔ Withdraw savings from either CompA or CompB
✔ View transaction history
✔ State management using Bloc
✔ Local storage using Hive
✔ Dependency Injection using GetIt

- **Bloc for state management** ensuring a structured and scalable approach.

---

## 🚀 Why Use Bloc for State Management?

Bloc (**Business Logic Component**) is used because:
- **Separation of Concerns:** Keeps UI, business logic, and data handling separate.
- **Predictability:** The state transitions follow a clear flow from `Event -> Bloc -> State`.
- **Testability:** Logic is encapsulated in the Bloc, making it easier to write unit tests.
- **Scalability:** Well-suited for complex applications with multiple UI states.
- **Performance:** Bloc ensures that UI rebuilds only when necessary, reducing unnecessary widget rebuilds.

Without Bloc, managing UI updates, data persistence, and event handling would require manually handling `setState()`, leading to unstructured and error-prone code.

#📂 Project Structure (MVVM)


lib/
│── main.dart
│── core/
│   ├── database/
│   │   ├── hive_service.dart
│   ├── utils/
│       ├── constants.dart
│── data/
│   ├── models/
│   │   ├── savings_model.dart
│   ├── repositories/
│       ├── savings_repository.dart
│── domain/
│   ├── usecases/
│       ├── add_savings_usecase.dart
│       ├── withdraw_savings_usecase.dart
│── presentation/
│   ├── bloc/
│   │   ├── savings_bloc.dart
│   │   ├── savings_event.dart
│   │   ├── savings_state.dart
│   ├── views/
│       ├── main_screen.dart
│       ├── savings_entry_screen.dart
│       ├── withdrawal_screen.dart
│       ├── history_screen.dart
│   ├── widgets/
│       ├── balance_card.dart
│── injection_container.dart
│── pubspec.yaml
│── README.md

#🛠️ Tech Stack

Flutter - UI framework
Dart - Programming language
Hive - Local storage
Bloc - State management
GetIt - Dependency injection

#🚀 Setup & Installation
1️⃣ Clone the repository
git clone https://github.com/KishanSingh1993/flutter_saving_app.git
cd flutter-savings-app
2️⃣ Install dependencies
flutter pub get
3️⃣ Run the app
flutter run

#📷 Screenshots

<img src="/ss/1.png" height="400px"/> <img src="/ss/2.png" height="400px"/> <img src="/ss/3.png" height="400px"/>
<img src="/ss/4.png" height="400px"/> <img src="/ss/5.png" height="400px"/> <img src="/ss/6.png" height="400px"/>
<img src="/ss/7.png" height="400px"/> <img src="/ss/8.png" height="400px"/> <img src="/ss/9.png" height="400px"/>


#🤝 Contributing
Feel free to fork the repo and submit pull requests!