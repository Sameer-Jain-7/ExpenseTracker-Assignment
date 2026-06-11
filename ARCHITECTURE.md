# Architecture Documentation

## Architectural Pattern

The application follows the MVVM (Model-View-ViewModel) architecture pattern.

## Why MVVM

MVVM was selected because it:

- Separates business logic from UI
- Improves maintainability
- Simplifies testing
- Aligns well with SwiftUI's data-binding model
- Enables scalable feature additions

## Layers

### Models

Responsible for representing application data.

Examples:

- Expense
- ExpenseCategory
- ExpenseMonth

### Views

Responsible for rendering UI and user interaction.

Examples:

- ExpenseListView
- AddExpenseView
- AnalyticsView

### ViewModels

Responsible for business logic and state management.

Examples:

- ExpenseViewModel
- AnalyticsViewModel

### Repository Layer

Acts as an abstraction between business logic and persistence.

Examples:

- ExpenseRepository
- LocalExpenseRepository

### Persistence Layer

Handles local storage and retrieval of expense data.

Examples:

- UserDefaultsManager

## Data Flow

User Action
↓
View
↓
ViewModel
↓
Repository
↓
Persistence Layer

The ViewModel updates published state, which automatically refreshes SwiftUI views.

## Dependency Injection

Repositories are injected into ViewModels, allowing unit tests to use mock repositories instead of real persistence implementations.

Example:

ExpenseViewModel(repository: MockExpenseRepository())

## Testing Strategy

Unit tests focus on:

- CRUD operations
- Filtering logic
- Total expense calculations
- Analytics calculations

Mock repositories are used to isolate business logic from storage implementation.

## Design Principles

- Single Responsibility Principle
- Separation of Concerns
- Dependency Injection
- Reusable UI Components
