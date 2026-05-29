/// Centralized icon asset paths and custom icon constants.
/// Ensures that icon strings are not hardcoded throughout the app.
class AppIcons {
  AppIcons._();

  static const String _basePath = 'assets/icons/';

  // Generic Icons
  static const String home = '${_basePath}home.svg';
  static const String search = '${_basePath}search.svg';
  static const String cart = '${_basePath}cart.svg';
  static const String profile = '${_basePath}profile.svg';
  static const String settings = '${_basePath}settings.svg';
  static const String notification = '${_basePath}notification.svg';
  
  // B2B specific icons
  static const String inventory = '${_basePath}inventory.svg';
  static const String orders = '${_basePath}orders.svg';
  static const String analytics = '${_basePath}analytics.svg';
  static const String supplier = '${_basePath}supplier.svg';
  static const String chat = '${_basePath}chat.svg';
}
