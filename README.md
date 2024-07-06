# Hack and Hunt

Hack and Hunt is a Flutter-based platform for organizing and participating in treasure hunts combined with coding competitions. It offers a unique blend of adventure and coding challenges, making learning and competition fun and engaging.

## UI/UX Preview
![Screenshot from 2024-07-06 17-41-38](https://github.com/i-ces/treasurehunt-app/assets/115852972/4a113b0d-3ae5-4d94-a6e1-c7d37ffb3190)
![Screenshot from 2024-07-06 17-41-42](https://github.com/i-ces/treasurehunt-app/assets/115852972/23c8de54-ad77-4baf-a520-3202a26d07ff)
![Screenshot from 2024-07-06 17-41-44](https://github.com/i-ces/treasurehunt-app/assets/115852972/21fb0752-73e2-4c72-9ea8-0cfa7c6ae4be)
![Screenshot from 2024-07-06 17-41-51](https://github.com/i-ces/treasurehunt-app/assets/115852972/6ce614eb-b81a-4ca8-a5b0-ecaf8e1feb51)
![Screenshot from 2024-07-06 17-42-46](https://github.com/i-ces/treasurehunt-app/assets/115852972/f7b0f981-fe43-4f97-9286-7f35b8e16ff7)
![Screenshot from 2024-07-06 17-42-52](https://github.com/i-ces/treasurehunt-app/assets/115852972/b9f348a0-0ed2-4038-8583-992ee261c5aa)
![Screenshot from 2024-07-06 17-42-55](https://github.com/i-ces/treasurehunt-app/assets/115852972/f8c97bff-bb45-41b8-a8ae-d13359203ef5)
![Screenshot from 2024-07-06 17-42-58](https://github.com/i-ces/treasurehunt-app/assets/115852972/e74e4c1f-7c6a-437c-8c7c-f9b41eb0f9f8)
![Screenshot from 2024-07-06 17-43-22](https://github.com/i-ces/treasurehunt-app/assets/115852972/b727b94e-8e3b-42d3-a5f9-358c29576c1c)
![Screenshot from 2024-07-06 17-43-30](https://github.com/i-ces/treasurehunt-app/assets/115852972/1af3e2b6-d80f-46be-8391-768ed3547058)
![Screenshot from 2024-07-06 17-43-33](https://github.com/i-ces/treasurehunt-app/assets/115852972/4d2c60d0-8401-45c4-b8e7-264f05ea8623)
![Screenshot from 2024-07-06 17-43-40](https://github.com/i-ces/treasurehunt-app/assets/115852972/7062b5ae-2390-4ef3-a190-7f23c2525b0a)


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
