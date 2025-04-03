# clean_architecture

This project implements Clean Architecture in a Flutter app, using BLoC for state management and GetIt for dependency injection. The app fetches product data from FakeStoreAPI and displays it in a simple UI.

# Project Structure


lib/
│── core/
│   ├── services/       # Services, including dependency injection
│── feature/
│   ├── main_user_screen/
│   │   ├── data/       # Data layer (models, repositories, API calls)
│   │   ├── domain/     # Business logic (entities, use cases, repository contracts)
│   │   ├── presentation/ # UI layer (widgets, BLoCs, pages)
│── main.dart           # App entry point


# used Dependencies
equatable : (https://pub.dev/packages/equatable),
flutter_bloc : (https://pub.dev/packages/flutter_bloc),
Dartz : (https://pub.dev/packages/dartz),
HTTP : (https://pub.dev/packages/http),
GetIt : (https://pub.dev/packages/get_it),

# API Integration
https://fakestoreapi.com/products
