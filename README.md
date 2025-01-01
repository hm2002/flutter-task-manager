# Task Manager

Task Manager is a Flutter-based application for managing tasks effectively. It allows users to add, edit, delete, and toggle task statuses (completed or pending) with sorting options by date and priority.

## Features

- Add and edit tasks with titles, descriptions, dates, and priorities.
- Mark tasks as completed or pending.
- Sort tasks by date or priority.
- Persistent data storage using Hive and SQLite.
- change themeMode of the Application implemented with Hive.

## Requirements

To run this project, ensure you have the following:

- Flutter SDK (Version 3.0 or later) installed on your system.
- Android Studio, Xcode, or a preferred IDE for Flutter development.
- An emulator or a connected device.

## Getting Started
### Clone the Repository

git clone https://github.com/hm2002/flutter-task-manager.git\
cd flutter-task-manager

## Install Dependencies

Run the following command to install all required packages:\
flutter pub get

## Run the App

Use the following command to start the app on your connected device or emulator:\
flutter run

## Project Structure

- models/: Contains task-related data models.
- providers/: State management using Riverpod.
- data/: Handles database operations with Hive and SQLite.
- views/: Contains UI components and screens.
- core/: Constants and utility files for validation and theme management.

## Contributing

Feel free to fork the repository and submit a pull request. Contributions are always welcome!

## License

This project is licensed under the MIT License. See the LICENSE file for details.