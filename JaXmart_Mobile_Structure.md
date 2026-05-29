# 🛒 JaXmart — Enterprise B2B Marketplace Flutter App Structure
**Flutter 3.x | Clean Architecture | BLoC/Cubit | Feature-First | Modular**

---

## 🏗️ Architectural Overview
JaXmart follows a **Feature-First Clean Architecture**. This ensures scalability, testability, and separation of concerns for a large B2B marketplace application suitable for multiple developers and long-term maintenance.

```text
lib/
 ├── app/            # App initialization, main widget, providers
 ├── core/           # Core configurations, constants, errors, network clients
 ├── config/         # Environment setup, themes, routes config
 ├── features/       # Independent feature modules (Auth, Buyer, Supplier, etc.)
 ├── shared/         # Shared/Reusable widgets across the app
 ├── services/       # 3rd-party services (Firebase, Socket/SignalR, Storage)
 ├── routes/         # App routing definitions (GoRouter or auto_route)
 └── main.dart       # App Entry Point
```

Inside each feature inside `features/`, we follow **Clean Architecture** strict layering:
```text
features/feature_name/
  ├── data/
  │    ├── datasource/    # Remote/Local API calls
  │    ├── models/        # JSON serialization models (DTOs)
  │    └── repositories/  # Implementations of Domain repositories
  ├── domain/
  │    ├── entities/      # Core business objects
  │    ├── repositories/  # Abstract repository interfaces
  │    └── usecases/      # Specific business logic actions
  └── presentation/
       ├── bloc/          # State management (BLoC/Cubit)
       ├── pages/         # UI Screens
       └── widgets/       # Feature-specific UI components
```

---

## 📂 Complete Folder Structure

```text
jaxmart_mobile/
│
├── pubspec.yaml                              # App dependencies
├── analysis_options.yaml                     # Linter/Formatting rules
├── .env.dev                                  # Development environment variables
├── .env.prod                                 # Production environment variables
│
├── android/                                  # Android native code
├── ios/                                      # iOS native code
├── assets/                                   # ── ASSETS ──
│   ├── images/                               # PNG/JPG files
│   ├── icons/                                # SVG/App icons
│   ├── fonts/                                # Custom fonts
│   └── translations/                         # JSON files for fallback localization
│
├── test/                                     # ── UNIT & WIDGET TESTS ──
│   ├── core/                                 # Testing core utilities
│   ├── features/                             # Feature-by-feature test cases
│   │   └── auth/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   └── shared/                               # Shared widget tests
│
└── lib/
    │
    ├── main.dart                             # Entry point: runs app, initializes DI
    │
    ├── app/                                  # ── APP INITIALIZATION ──
    │   ├── app.dart                          # MaterialApp, theme/localization setup
    │   └── di/                               # Dependency Injection (get_it + injectable)
    │
    ├── config/                               # ── CONFIGURATIONS ──
    │   ├── environment/                      # Environment configs (Dev, Staging, Prod)
    │   ├── theme/                            # Light/Dark mode, colors, typography
    │   └── localization/                     # l10n setup, language configurations
    │
    ├── routes/                               # ── ROUTING ──
    │   ├── app_router.dart                   # Router configuration (e.g., GoRouter)
    │   └── route_names.dart                  # Constants for route paths
    │
    ├── services/                             # ── EXTERNAL SERVICES ──
    │   ├── firebase/                         # Push notifications, Analytics, Crashlytics
    │   ├── chat/                             # Socket.io / SignalR real-time chat service
    │   ├── storage/                          # Secure Storage & Shared Preferences
    │   └── local_auth/                       # Biometric / Device authentication
    │
    ├── core/                                 # ── CORE LAYER (App-wide Utilities) ──
    │   ├── constants/                        # API endpoints, generic strings
    │   ├── error/                            # Failure handling, exceptions
    │   ├── network/                          # Dio client, Interceptors, Network Checker
    │   ├── usecases/                         # Base UseCase abstract class
    │   ├── utils/                            # Helper functions, formatters, logging
    │   └── extensions/                       # String, Context, DateTime extensions
    │
    ├── shared/                               # ── SHARED WIDGETS & UI COMPONENTS ──
    │   ├── buttons/                          # Custom buttons (Primary, Outline, etc.)
    │   ├── inputs/                           # Text fields, Dropdowns, Search bars
    │   ├── dialogs/                          # Alerts, Bottom sheets, Snackbars
    │   ├── loaders/                          # Shimmers, Spinners
    │   └── media/                            # Media viewer, PDF viewer, Image caching
    │
    └── features/                             # ── FEATURES (Modules) ──
        │
        ├── auth/                             # 1. Authentication Module
        │   ├── data/
        │   │   ├── datasource/               # auth_remote_datasource.dart
        │   │   ├── models/                   # login_model.dart, register_model.dart
        │   │   └── repositories/             # auth_repository_impl.dart
        │   ├── domain/
        │   │   ├── entities/                 # user_entity.dart
        │   │   ├── repositories/             # auth_repository.dart
        │   │   └── usecases/                 # login_usecase.dart, verify_otp_usecase.dart
        │   └── presentation/
        │       ├── bloc/                     # auth_bloc.dart, auth_state.dart
        │       ├── pages/                    # login_page.dart, register_buyer_page.dart, otp_page.dart
        │       └── widgets/                  # password_field_widget.dart
        │
        ├── buyer/                            # 2. Buyer Module
        │   ├── data/ ...
        │   ├── domain/ ...
        │   └── presentation/
        │       ├── bloc/                     # buyer_dashboard_bloc.dart, cart_bloc.dart
        │       ├── pages/                    # home_dashboard_page.dart, product_details_page.dart
        │       └── widgets/                  # product_card_widget.dart, supplier_directory_item.dart
        │
        ├── supplier/                         # 3. Supplier Module
        │   ├── data/ ...
        │   ├── domain/ ...
        │   └── presentation/
        │       ├── bloc/                     # supplier_dashboard_bloc.dart, product_management_bloc.dart
        │       ├── pages/                    # supplier_dashboard_page.dart, add_edit_product_page.dart
        │       └── widgets/                  # quotation_card_widget.dart
        │
        ├── common/                           # 4. Common Features (Search, Filters, WebView)
        │   └── presentation/
        │       ├── pages/                    # global_search_page.dart, notifications_page.dart
        │       └── widgets/                  # filter_bottom_sheet.dart
        │
        ├── loyalty/                          # 5. Loyalty & Token Module
        │   ├── data/ ...
        │   ├── domain/ ...
        │   └── presentation/
        │       ├── bloc/                     # wallet_bloc.dart, rewards_bloc.dart
        │       └── pages/                    # wallet_page.dart, reward_history_page.dart
        │
        └── settings/                         # 6. Settings Module (Privacy, Lang, Currency)
            ├── data/ ...
            ├── domain/ ...
            └── presentation/
                ├── bloc/                     # settings_bloc.dart
                └── pages/                    # settings_page.dart, security_page.dart
```

---

## 📁 Explanation of Specific Folders

### 1. Mandatory Folders
- **`lib/main.dart`**: The entry point. Initializes environment, Dependency Injection, and runs the app.
- **`core/`**: Non-feature-specific code. If you remove a feature, the core should still compile. Contains API clients, error handling classes, and utilities.
- **`features/`**: The heart of the app. Every major capability lives here, isolated from others.
- **`shared/`**: UI components reused across multiple features (e.g., standard App Buttons, TextFields).

### 2. Core Structure (`core/`)
- **`network/`**: Contains Dio client setup, interceptors (for appending JWT tokens to headers, logging, handling 401 token expiry), and connectivity checkers.
- **`error/`**: `Failure` classes and `Exceptions`. Converts raw API errors into user-friendly domain failures.
- **`utils/`**: Formatters (Currency, Date), validators (Email, Phone), and custom loggers.

### 3. Feature Structure (`features/`)
- **`data/`**: The outer layer. Handles external data sources (API, SQLite, SharedPreferences). Models here extend Entities and add JSON serialization.
- **`domain/`**: The inner layer. Completely independent of Flutter and external packages. Contains business rules (`Entities`), abstract `Repositories`, and `UseCases` (single-responsibility business actions).
- **`presentation/`**: The UI layer. Contains `pages/` (Screens), `widgets/` (UI components specific to the screen), and `bloc/` (State Management).

### 4. API Handling Structure
Located primarily in `core/network/` and `features/.../data/datasource/`:
- **API Client**: `core/network/dio_client.dart`
- **Endpoints**: `core/constants/api_endpoints.dart`
- **Data Sources**: Feature-specific files like `buyer_remote_datasource.dart` using the Dio client to fetch data and return `Models`.

### 5. Chat Socket Structure
Located in `services/chat/`:
- **`socket_service.dart`**: Initializes Socket.io/SignalR client, handles connection/disconnection, and listens to global socket events.
- Individual features (like `buyer` or `supplier`) can listen to streams provided by this service in their respective BLoCs.

### 6. Firebase & Push Notifications Structure
Located in `services/firebase/`:
- **`firebase_messaging_service.dart`**: Handles foreground/background push notifications, FCM token generation, and tap routing.
- **`crashlytics_service.dart`**: For tracking fatal/non-fatal errors in production.

### 7. Localization & Environment Structure
- **Environment**: `.env.dev` and `.env.prod` files in the root directory. Managed in Flutter via the `config/environment/` folder using packages like `flutter_dotenv`.
- **Localization**: Follows standard Flutter `l10n/` or `assets/translations/` using `flutter_localizations` or `easy_localization` package for multi-language support (e.g., English, Arabic, etc.).

---

## 🛠️ Recommended Packages

| Category | Package Name | Purpose |
|---|---|---|
| **State Management** | `flutter_bloc`, `equatable` | Robust, predictable state management. |
| **Networking** | `dio`, `retrofit` | HTTP requests, interceptors, code-gen for APIs. |
| **Dependency Injection**| `get_it`, `injectable` | Service locator and DI setup. |
| **Routing** | `go_router` or `auto_route` | Deep linking, declarative navigation. |
| **Storage** | `flutter_secure_storage`, `shared_preferences`, `hive` | Local caching, secure token storage. |
| **UI & Styling** | `cached_network_image`, `shimmer`, `flutter_svg` | Image caching, loading states, vector graphics. |
| **Real-time** | `socket_io_client` / `signalr_netcore` | Real-time chat & notifications. |
| **Localization** | `easy_localization` or `intl` | Multi-language setup. |
| **Environment** | `flutter_dotenv` or `envied` | Securing base URLs and API keys. |
| **Functional Prog.** | `fpdart` or `dartz` | Error handling using `Either<Failure, Success>`. |

---

## 📝 Best Practices & Naming Conventions

### Naming Conventions
- **Files/Folders**: `snake_case` (e.g., `login_page.dart`, `auth_repository.dart`).
- **Classes**: `PascalCase` (e.g., `LoginPage`, `AuthRepository`).
- **Variables/Methods**: `camelCase` (e.g., `isLoggedIn`, `fetchProducts()`).
- **Constants**: `SCREAMING_SNAKE_CASE` or `camelCase` depending on context (e.g., `BASE_URL`).

### Best Practices for Large Teams
1. **Strict Layer Separation**: UI (Presentation) should never make API calls directly. It must call a BLoC/Cubit, which calls a UseCase, which calls a Repository.
2. **Dependency Injection**: Never hardcode dependencies. Inject them via `get_it` to make unit testing easy.
3. **UseCases**: Keep UseCases strictly single-purpose (e.g., `LoginUseCase`, `GetProductsUseCase`). This improves readability and code reusability.
4. **Error Handling**: Use `Either<Failure, Type>` from packages like `fpdart` to force developers to handle both Success and Failure states explicitly.
5. **Reusable Widgets**: Before creating a button or text field in a feature, check the `shared/` folder. Centralize core UI components for consistency.
6. **Testing**: Write unit tests for `Domain` and `Data` layers first. Mock external dependencies using `mockito` or `mocktail`.
7. **Code Generation**: Utilize `build_runner` for JSON serialization, routing, and DI to reduce boilerplate and human error.
