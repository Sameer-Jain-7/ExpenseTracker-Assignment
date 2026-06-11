# Expense Tracker

## Overview

Expense Tracker is a SwiftUI-based iOS application that helps users record, manage, and analyze their daily expenses. The application follows the MVVM architecture pattern and uses local persistence to store expense data on the device.

## Features

### Expense Management

- Add new expenses
- Edit existing expenses
- Delete expenses
- Categorize expenses

### Filtering

- Filter by category
- Filter by month
- Filter by year
- Combined filtering support

### Analytics

- Total expense summary
- Transaction count
- Category breakdown
- Average expense calculation
- Top spending category

### Persistence

- Local data storage using UserDefaults
- Data retained between app launches

### Additional Features

- Expense editing
- Swipe actions for edit/delete
- Dynamic month and year filtering
- Reusable SwiftUI components

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture pattern with Repository abstraction for data access.

## Technology Stack

- Swift
- SwiftUI
- MVVM
- UserDefaults
- Repository Pattern
- Swift Testing / XCTest

## Project Structure

ExpenseTracker/

- Models
- Views
- ViewModels
- Repository
- Utilities
- Components

## Running the Application

### Prerequisites

- macOS
- Xcode 16 or later
- iOS 18 Simulator (or compatible version)

### Setup

1. Clone the repository

   git clone https://github.com/Sameer-Jain-7/ExpenseTracker-Assignment.git

2. Open `ExpenseTracker.xcodeproj`

3. Select an iPhone Simulator

4. Build and Run (`⌘ + R`)

### Running Tests

1. Open the project in Xcode
2. Press `⌘ + U` to run all unit tests

## Screenshots

### Expense Dashboard

<img width="200" alt="Expense Dashboard" src="https://github.com/user-attachments/assets/73cec8b7-d4b5-47ed-99e2-ca0af00cf730" />

### Add Expense

<img width="200" alt="Add Expense" src="https://github.com/user-attachments/assets/9e3d4dac-9e9e-451f-a875-5238d9b5402a" />

### Analytics

<img width="200" alt="Analytics" src="https://github.com/user-attachments/assets/da773822-88c5-4b3e-8bac-a7b083f15536" />

## Testing

The project includes unit tests covering:

- Expense creation
- Expense updates
- Expense deletion
- Category filtering
- Month filtering
- Year filtering
- Analytics calculations

## AI Usage Reflection

AI tools were used primarily for architecture validation, UI refinement suggestions, SwiftUI implementation guidance, and test case brainstorming. All generated suggestions were reviewed, adapted, and validated before integration into the application. AI was used as a productivity aid rather than a replacement for implementation and design decisions.

## Repository

GitHub Repository:
https://github.com/Sameer-Jain-7/ExpenseTracker-Assignment
