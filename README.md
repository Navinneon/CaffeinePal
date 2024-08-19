# Caffeine Pal Fork: App Intents Experimentation

## Overview

This fork of the Caffeine Pal project is dedicated to experimenting with and implementing **App Intents** introduced in iOS 17, along with the new **Widgets** and **Control Center** features available in iOS 18.

![Caffine Pal on iOS](https://github.com/user-attachments/assets/d068432f-4606-477b-9dab-94e4efa0acef)

## Features Implemented

### 1. App Intents (iOS 17+)

- **Ordinary App Intents**: Basic intents that interact with the app to perform simple tasks.
  
- **Single Parameter using Enum (App Enum)**: Created App Intents that leverage enums for single-parameter inputs, simplifying user interactions.

- **Complex Structure for Dynamic Models (App Entity and App Queries)**:
  - **App Entity**: Defined complex entities that represent dynamic data models within the app.
  - **App Queries**: Implemented search and filtering functionalities to dynamically query these entities.

- **Custom Views**: Integrated custom views to provide rich visual feedback when an App Intent is executed.

### 2. Siri Integration

- Integrated App Intents with Siri to allow voice-activated commands and interactions with the app using `AppShortcutsProvider`.

### 3. Spotlight Integration

- Configured App Intents to be accessible via Spotlight search using `AppShortcutsProvider`, allowing users to trigger actions directly from the search interface.

### 4. Widgets (iOS 18)

- **Widgets**: Extended App Intents into widgets, allowing users to interact with the app directly from their home or lock screen.

### 5. Control Center (iOS 18)

- **Control Widgets**: Configured Control Center widgets that provide quick access to app functionalities directly from the Control Center.

## Future Plans

- Configure interactive widgets to further enhance user interaction.

## Getting Started

To explore the implemented features, clone the repository and open it in Xcode. Make sure you have at least iOS 17 SDK for most features and iOS 18 SDK for the latest widgets and Control Center integrations.

## Requirements

- **Xcode**: Version 15.0 or higher
- **iOS SDK**: iOS 17.0+ for App Intents, iOS 18.0+ for Widgets and Control Center

## Contribution

This project is primarily for personal experimentation. However, contributions and suggestions are welcome. Feel free to fork the project and submit pull requests.

## License

This project is forked from the original Caffeine Pal project. Please respect the original licensing terms and conditions.

---

This version reflects the current status of the project and your future plans.
