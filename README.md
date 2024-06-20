# Hack and Hunt

Hack and Hunt is a Flutter-based platform for organizing and participating in treasure hunts combined with coding competitions. It offers a unique blend of adventure and coding challenges, making learning and competition fun and engaging.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Setup Guide](#setup-guide)
- [Branch Naming Convention](#branch-naming-convention)
- [Folder Architecture](#folder-architecture)
- [Contributing](#contributing)

## Features

- Create and manage treasure hunts
- Participate in coding competitions
- Real-time updates and leaderboards
- User authentication and profiles
- Interactive maps for treasure hunts
- Hints and clues for challenges

## Installation

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Git: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- Code Editor: VS Code or Android Studio recommended

### Setup Guide

1. **Clone the repository:**

   ```bash
   git clone https://github.com/i-ces/treasurehunt-app.git
   cd treasurehunt-app
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

4. **Build for specific platforms:**

   - **Android:**

     ```bash
     flutter build apk
     ```

   - **iOS:**

     ```bash
     flutter build ios
     ```

### Environment Setup

- Create a `.env` file in the root directory and add the necessary environment variables:

  ```plaintext
  API_URL=https://api.yourservice.com
  GOOGLE_MAPS_API_KEY=your_google_maps_api_key
  ```

## Branch Naming Convention

To maintain a clean and manageable git workflow, we follow a specific branch naming convention:

- **feature/**: New features
- **bugfix/**: Bug fixes
- **hotfix/**: Quick fixes in production
- **release/**: Release versions

Examples:

- `feature/sp-update-readme`
- `bugfix/fix-login-issue`

## Folder Architecture

We follow the MVC (Model-View-Controller) architecture for organizing the project structure. Here's an overview of the folder architecture:

```sh
hack-and-hunt/
├── lib/
│   ├── controllers/
│   │   ├── auth_controller.dart
│   │   ├── treasure_hunt_controller.dart
│   │   └── coding_competition_controller.dart
│   ├── models/
│   │   ├── user.dart
│   │   ├── treasure_hunt.dart
│   │   └── coding_competition.dart
│   ├── views/
│   │   ├── auth/
│   │   │   ├── login_view.dart
│   │   │   └── signup_view.dart
│   │   ├── treasure_hunt/
│   │   │   ├── treasure_hunt_list_view.dart
│   │   │   └── treasure_hunt_detail_view.dart
│   │   ├── coding_competition/
│   │   │   ├── competition_list_view.dart
│   │   │   └── competition_detail_view.dart
│   │   └── common/
│   │       ├── widgets/
│   │       │   ├── custom_button.dart
│   │       │   └── custom_input.dart
│   │       └── utils/
│   │           └── constants.dart
│   ├── main.dart
│   └── routes.dart
├── assets/
│   ├── images/
│   └── fonts/
├── test/
└── .env
```

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch following the branch naming convention.
3. Make your changes and commit them.
4. Push your branch to your fork.
5. Open a pull request with a detailed description of your changes.
