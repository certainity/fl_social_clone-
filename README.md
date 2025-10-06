# Flutter Social Clone

A Flutter application for building a social media clone.

## Features

- Basic Flutter web application scaffolding
- Automated deployment to GitHub Pages
- Material Design 3 UI

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher

### Running Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/certainity/fl_social_clone-.git
   cd fl_social_clone-
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run -d chrome
   ```

### Building for Web

```bash
flutter build web --release
```

## Deployment

The application is automatically deployed to GitHub Pages when changes are pushed to the `main` branch using GitHub Actions.

The workflow:
1. Checks out the code
2. Sets up Flutter
3. Installs dependencies
4. Builds the web application
5. Deploys to GitHub Pages

## Project Structure

```
.
├── lib/
│   └── main.dart          # Main application entry point
├── web/
│   ├── index.html         # Web app entry point
│   └── manifest.json      # PWA manifest
├── .github/
│   └── workflows/
│       └── deploy.yml     # GitHub Actions workflow
├── pubspec.yaml           # Project dependencies
└── README.md              # This file
```

## Development

This project uses GitHub Actions for CI/CD. Every push to main triggers a deployment to GitHub Pages.

## License

This project is open source and available under the MIT License.
