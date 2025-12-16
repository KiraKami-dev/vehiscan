# VehiScan

A Flutter application for vehicle scanning and management with role-based access control for guards and administrators.

## Overview

VehiScan is a mobile application designed to facilitate vehicle scanning and management operations. The app provides separate interfaces for guards and administrators, allowing for efficient vehicle tracking and administrative control.

## Features

- **Role-Based Access**: Separate interfaces for Guards and Administrators
- **Local Storage**: Persistent data storage using SharedPreferences
- **State Management**: Built with GetX for navigation and state management
- **Cross-Platform**: Supports Android, iOS, Web, Linux, macOS, and Windows

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── src/
│   ├── app.dart             # Main app widget and theme configuration
│   ├── screens/
│   │   ├── home_screen.dart          # Main home screen with role selection
│   │   ├── admin_control.dart/
│   │   │   └── admin_home.dart       # Administrator interface
│   │   └── guard_screen/
│   │       └── home_guard.dart       # Guard interface
│   ├── services/
│   │   ├── local_storage.dart        # Local storage service
│   │   └── utils.dart                # Utility functions and theme
│   ├── utils/
│   │   └── shared_prefs.dart        # SharedPreferences wrapper
│   └── widgets/
│       └── appbar.widget.dart       # Custom app bar widget
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.1 <4.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDEs)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd vehiscan
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Dependencies

### Main Dependencies
- **get**: ^4.6.5 - State management and navigation
- **shared_preferences**: ^2.0.15 - Local data persistence
- **riverpod**: ^2.3.7 - State management (for future use)
- **cupertino_icons**: ^1.0.2 - iOS-style icons

### Dev Dependencies
- **flutter_test**: Flutter testing framework
- **flutter_lints**: ^2.0.0 - Linting rules

## Usage

1. Launch the app to see the home screen
2. Select your role:
   - **Guard**: Access the guard interface for vehicle scanning operations
   - **Admin**: Access the administrative control panel

## Development

### Running Tests
```bash
flutter test
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is private and not intended for publication.

## Support

For issues and questions, please open an issue in the repository.

---

Built with Flutter 💙
