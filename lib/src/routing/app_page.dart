/// Enum for app pages.
/// 
/// Allows for easy selection:
/// 
/// ```dart
/// context.go(AppPages.profileList.path);
/// context.goNamed(AppPages.profileList.name);
/// ```
enum AppPage {
  /// The root of the application.
  root,
  /// The profile list page.
  profileList,
  /// The profile detail page.
  profileDetail,
}

/// [AppPage] extensions.
extension AppPageExtension on AppPage {
  /// The navigation path.
  String get path {
    switch (this) {
      case AppPage.root:
        return _rootPath;
      case AppPage.profileList:
        return _profileListPath;
      case AppPage.profileDetail:
        return _profileDetailPath;
      default:
        return _rootPath;
    }
  }
}

/// The path of the application root.
/// 
/// [GoRouter] requires this to be handled.
const String _rootPath = '/';

/// The path of the profile list page.
const String _profileListPath = '/profiles';

/// The path of the profile detail page.
const String _profileDetailPath = ':profileId';