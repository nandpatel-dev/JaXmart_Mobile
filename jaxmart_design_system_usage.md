# JaXmart Master Design System

Welcome to the JaXmart Master Design System. This centralized architecture ensures that the JaXmart B2B application maintains a scalable, professional, and ultra-premium modern interface. The UI relies on this single source of truth for styles, preventing hard-coded values and keeping the codebase maintainable.

## 📂 Folder Architecture

Located in `lib/core/theme/`:

- **`app_colors.dart`**: Complete color palette with semantic colors, neutrals, and primary brand colors (Orange). Light/Dark modes are accounted for.
- **`app_text_styles.dart`**: Premium typography scales using modern standard font metrics. Responsive to theme changes.
- **`app_spacing.dart`**: 4pt/8pt grid based spacing system (xs, sm, md, lg, xl, etc.).
- **`app_radius.dart`**: Global border radius system for rounded aesthetics.
- **`app_shadows.dart`**: Soft, layered box shadows inspired by modern B2B standards (Stripe/Linear).
- **`app_dimensions.dart`**: Global dimensions, touch targets (buttons/inputs), and breakpoints for responsiveness.
- **`app_theme.dart`**: The root `ThemeData` configuration mapping our design tokens to Material 3 themes.
- **`app_button_styles.dart`**: Reusable button themes (primary, secondary, text).
- **`app_input_styles.dart`**: Text field decorations and specialized input styles.
- **`app_decoration.dart`**: Pre-built decorators for cards, containers, elevated surfaces.
- **`app_gradients.dart`**: Centralized linear gradients.
- **`app_icons.dart` / `app_assets.dart`**: Centralized path references for images and SVG icons.
- **`app_constants.dart`**: UI behavior constants like animation durations.

## 💡 Best Practices

1. **Avoid Hardcoded Values**: **NEVER** use values like `padding: EdgeInsets.all(16)` or `color: Colors.orange`. Always use `EdgeInsets.all(AppSpacing.md)` and `AppColors.primary`.
2. **Access Theme via Context**: For colors and text styles that change based on theme, ideally use `Theme.of(context).colorScheme.primary` or `Theme.of(context).textTheme.bodyLarge`.
3. **Use the Helpers**: Use helper functions like `AppShadows.getShadow(context)` or `AppDecoration.card(isDark: ...)` to adapt to theme changes seamlessly.
4. **Extend, Don't Override**: If a specific screen needs a unique look, create a new composable widget utilizing the base design system instead of overriding global styles inline.

## 🛠️ Usage Examples

### 1. Initializing Theme in `main.dart`
```dart
import 'core/theme/app_theme.dart';

MaterialApp(
  title: 'JaXmart B2B',
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
  home: const HomeScreen(),
);
```

### 2. Spacing & Colors
```dart
Container(
  padding: const EdgeInsets.all(AppSpacing.md),
  color: AppColors.backgroundLight,
  child: Text(
    'Welcome back!',
    style: AppTextStyles.h2.copyWith(color: AppColors.textPrimaryLight),
  ),
);
```

### 3. Creating a Modern Card
```dart
Container(
  padding: const EdgeInsets.all(AppSpacing.lg),
  decoration: AppDecoration.card(isDark: Theme.of(context).brightness == Brightness.dark),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Order Analytics', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: AppSpacing.sm),
      Text('View your latest vendor statistics.', style: Theme.of(context).textTheme.bodyMedium),
    ],
  ),
)
```

### 4. Buttons
The buttons automatically inherit styles from `AppTheme.dart`, so standard Material buttons are already styled!
```dart
ElevatedButton(
  onPressed: () {},
  child: const Text('Confirm Order'),
)

OutlinedButton(
  onPressed: () {},
  child: const Text('Cancel'),
)
```

### 5. Responsive Checks
```dart
if (AppDimensions.isMobile(context)) {
  return MobileLayout();
} else {
  return DesktopLayout();
}
```
