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
