# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Development Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Analyze code for issues
flutter analyze

# Run tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# Generate Hive type adapters and Freezed code
dart run build_runner build --delete-conflicting-outputs

# Watch mode for code generation
dart run build_runner watch --delete-conflicting-outputs
```

## Architecture Overview

This is a Flutter personal finance tracker app using **Clean Architecture** with **BLoC** state management and **Freezed** for immutable state/events.

### Layer Structure (per feature)

```
features/<feature>/
├── data/
│   ├── data_source/    # Local/remote data sources (Hive implementation)
│   ├── models/         # Hive models with TypeAdapters (*.g.dart generated)
│   └── repository/     # Repository implementations
├── domain/
│   ├── entities/       # Business entities (extend Equatable)
│   ├── repository/     # Repository interfaces
│   └── usecases/       # Use cases returning Either<Failure, T>
└── presentation/
    ├── bloc/           # BLoC with Freezed events/states (*.freezed.dart generated)
    ├── pages/          # Page widgets (sheets, screens)
    └── widgets/        # Reusable UI components
```

### Core Features

- **Account**: Financial accounts with balance tracking, icons, colors
- **Category**: Transaction categories (income/expense) with icons and colors
- **Transaction**: Financial transactions linked to accounts and categories

---

## BLoC Pattern with Freezed

### State Structure (Freezed Union Types)

```dart
// account_state.dart
@freezed
class AccountState with _$AccountState {
  const AccountState._();  // Private constructor for custom methods

  const factory AccountState.initial() = AccountInitial;
  const factory AccountState.loading({
    @Default([]) List<AccountEntity> accounts,
    AccountEntity? selectedAccount,
  }) = AccountLoading;
  const factory AccountState.loaded({
    required List<AccountEntity> accounts,
    required AccountEntity selectedAccount,
  }) = AccountsLoaded;
  const factory AccountState.failure({
    required String message,
    @Default([]) List<AccountEntity> accounts,
    AccountEntity? selectedAccount,
  }) = AccountFailure;

  // Computed properties available on all states
  List<AccountEntity> get accounts => map(...);
  bool get isLoading => this is AccountLoading;
}
```

**Key principles:**
- Loading state preserves previous data (no UI flickering)
- All states carry accounts list for seamless transitions
- Use `map`/`when`/`maybeWhen` for exhaustive pattern matching

### Event Structure (Freezed)

```dart
// account_event.dart
@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.loadAccounts() = LoadAccountsEvent;
  const factory AccountEvent.create({required AccountEntity account}) = CreateAccountEvent;
  const factory AccountEvent.update({required AccountEntity account}) = UpdateAccountEvent;
  const factory AccountEvent.delete({required String accountId}) = DeleteAccountEvent;
  const factory AccountEvent.select({required String accountId}) = SelectAccountEvent;
}
```

### UI Pattern Matching

```dart
// In widgets - use maybeWhen for partial handling
state.maybeWhen(
  loaded: (accounts, selected) => AccountList(accounts),
  loading: (accounts, _) => accounts.isNotEmpty
      ? Stack(children: [AccountList(accounts), LoadingOverlay()])
      : LoadingSpinner(),
  failure: (message, _, __) => ErrorWidget(message),
  orElse: () => SizedBox.shrink(),
);
```

---

## Shared Widgets

### AppSheet (Bottom Sheets)

Located: `lib/core/shared/widgets/app_sheet.dart`

**Two modes:**

```dart
// Fixed size (for lists, full-screen content)
AppSheet.show(
  context: context,
  child: AccountsSheet(),
  initialChildSize: 0.9,
  minChildSize: 0.9,
  maxChildSize: 0.9,
);

// Flexible size (for forms - sizes to content)
AppSheet.showFlexible(
  context: context,
  child: AccountFormSheet(),
  maxHeightFraction: 0.9,  // Max 90% of screen
);
```

**Flexible sheet layout pattern:**
```dart
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Header(...),           // Fixed at top
    Flexible(
      child: SingleChildScrollView(
        child: Column(...),  // Scrollable content
      ),
    ),
    SaveButton(...),       // Fixed at bottom
  ],
)
```

### AdaptiveDialog (Platform-Adaptive Dialogs)

Located: `lib/core/shared/widgets/adaptive_dialog.dart`

```dart
// Confirmation dialog (destructive action)
final confirmed = await AdaptiveDialog.showConfirmation(
  context: context,
  title: 'Delete Account',
  content: 'Are you sure?',
  confirmText: 'Delete',
  isDestructive: true,  // Red on iOS, red text on Android
);

// Simple alert
await AdaptiveDialog.showAlert(
  context: context,
  title: 'Cannot Delete',
  content: 'You cannot delete the last account.',
);
```

### ColorPicker & IconPicker

Located: `lib/core/shared/widgets/color_picker_widget.dart`, `icon_picker_widget.dart`

Horizontal scrolling pickers with predefined colors/icons.

---

## Color Handling

### Hex ↔ Color Conversion

Located: `lib/core/shared/mappers/app_color_mappers.dart`

```dart
// String to Color
'1E88E5'.toColor()  // → Color(0xFF1E88E5)

// Color to String (Flutter 3.10+ compatible)
Color(0xFF1E88E5).toHex()  // → '1E88E5'
```

**Important:** Flutter 3.10+ changed `Color.r/g/b` to return 0.0-1.0 doubles. The mapper multiplies by 255.

### Predefined Colors (from ColorPicker)

```dart
// Available in color_picker_widget.dart
'000000'  // Black
'E53935'  // Red
'1E88E5'  // Blue
'43A047'  // Green
'FFB300'  // Amber
// ... see full list in widget
```

---

## Key Patterns

### Dependency Injection

GetIt (`sl`) configured in `lib/core/di/dependency_injection.dart`.

Registration order: DataSource → Repository → UseCases → Bloc

### Use Cases

```dart
class CreateAccountUseCase extends UseCase<AccountEntity, AccountEntity> {
  final AccountRepository repository;

  @override
  Future<Either<Failure, AccountEntity>> call(AccountEntity account) {
    if (account.name.trim().isEmpty) {
      return Future.value(Left(ValidationFailure(msg: 'Name required')));
    }
    return repository.createAccount(account);
  }
}
```

### Entity Extensions

```dart
// In account_entity.dart
extension AccountIconX on AccountEntity {
  AppIconType get iconType => AppIconType.fromString(icon ?? 'wallet');
}

extension AccountColorX on AccountEntity {
  Color get backgroundColor => color?.toColor() ?? Colors.grey;
}
```

### Form Sheet Pattern

```dart
class AccountFormSheet extends StatefulWidget {
  static Future<bool?> show({required BuildContext context, AccountEntity? account}) {
    return AppSheet.showFlexible(
      context: context,
      child: BlocProvider.value(
        value: context.read<AccountBloc>(),
        child: AccountFormSheet(account: account),
      ),
    );
  }
}

class _AccountFormSheetState extends State<AccountFormSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_, __) => Navigator.of(context).pop(true),  // Close on success
          failure: (msg, _, __) => showSnackBar(msg),
          orElse: () {},
        );
      },
      child: Column(...),
    );
  }
}
```

---

## Core Utilities

| Path | Purpose |
|------|---------|
| `lib/core/errors/failures.dart` | Failure types (CacheFailure, ValidationFailure) |
| `lib/core/usecases/usecase.dart` | Base UseCase class and NoParams |
| `lib/core/services/hive_service.dart` | Hive initialization and box management |
| `lib/core/constants/app_defaults.dart` | Default seeded accounts and categories |
| `lib/core/shared/mappers/` | Color, icon, currency mappers |
| `lib/core/extensions/` | BuildContext extensions for theme access |

---

## Adding a New Feature

1. **Domain layer first:**
   - Entity (extend Equatable)
   - Repository interface
   - Use cases

2. **Data layer:**
   - Model with `@HiveType` annotation
   - Data source interface + implementation
   - Repository implementation

3. **Generate code:**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Register in DI** (`dependency_injection.dart`)

5. **Presentation layer:**
   - Freezed events (`@freezed class FeatureEvent`)
   - Freezed state (`@freezed class FeatureState`)
   - Bloc
   - Add to MultiBlocProvider in `main.dart`

6. **Build UI:**
   - Pages/sheets
   - Widgets
