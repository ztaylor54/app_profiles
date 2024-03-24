import 'package:app_profiles/src/routing/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The drawer tabs.
const drawerTabs = [
  ScaffoldWithNavBarTabItem(
    appPage: AppPage.profileList,
    icon: Icon(Icons.list),
    label: 'My Profiles',
  ),
];

/// The main scaffold for app screens.
///
/// Provides a bottom nav and [SafeArea] container for the child.
class ScaffoldWithDrawerNav extends StatefulWidget {
  const ScaffoldWithDrawerNav({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ScaffoldWithDrawerNav> createState() => _ScaffoldWithDrawerNavState();
}

class _ScaffoldWithDrawerNavState extends State<ScaffoldWithDrawerNav> {
  /// Callback used to navigate to the desired tab.
  void _onDrawerItemTapped(BuildContext context, int tabIndex) {
    // make sure we're navigating to a new page
    if (!GoRouter.of(context)
        .location
        .startsWith(drawerTabs[tabIndex].appPage.path)) {
      // go to the initial location of the selected tab (by index)
      context.pop();
      context.push(drawerTabs[tabIndex].appPage.path);
    } else {
      // close the drawer but don't navigate
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), // here the desired height
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      drawer: _Drawer(
        items: drawerTabs,
        onTap: (index) => _onDrawerItemTapped(context, index),
      ),
      body: SafeArea(
        child: widget.child,
      ),
    );
  }
}

/// Tab item in the [ScaffoldWithDrawerNav].
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem({
    required this.appPage,
    required super.icon,
    super.label,
  });

  /// The [AppPage] this tab represents.
  final AppPage appPage;
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Color color;
  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 80,
      ),
      child: ListTile(
        title: Text(title),
        textColor: color,
        leading: icon,
        iconColor: color,
        onTap: onTap,
      ),
    );
  }
}

/// The drawer.
class _Drawer extends ConsumerWidget {
  const _Drawer({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  final List<ScaffoldWithNavBarTabItem> items;
  final void Function(int index) onTap;

  /// Highlight the first item in the list.
  Color iconColorSelector(int index) =>
      index == 0 ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(appScaffoldControllerProvider);
    final _tabs = List<Widget>.generate(
        items.length,
        (index) => _DrawerItem(
              title: items[index].label ?? "",
              color: iconColorSelector(index),
              icon: items[index].icon,
              onTap: () => onTap(index),
            ));

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tabs[0],
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Text(
                "Quick launch",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
