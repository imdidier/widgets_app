import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final bool hasNotch = MediaQuery.of(context).viewPadding.top > 40;
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(
          () {
            navDrawerIndex = value;
          },
        );
        context.push(appMenuItems[navDrawerIndex].link);
        widget.scaffoldKey.currentState!.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, hasNotch ? 10 : 25, 20, 10),
          child: const Text('Opciones del home'),
        ),
        ...appMenuItems.sublist(0, 4).map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text('Otras opciones'),
        ),
        ...appMenuItems.sublist(4).map(
              (menuItem) => NavigationDrawerDestination(
                icon: Icon(menuItem.icon),
                label: Text(menuItem.title),
              ),
            ),
      ],
    );
  }
}
