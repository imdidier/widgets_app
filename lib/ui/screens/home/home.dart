import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/menu/menu_item.dart';
import '../../widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String name = 'home_screen';
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = appMenuItems;

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        MenuItem item = menuItems[index];
        return _CustomListTitle(item: item);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        item.icon,
        color: colors.primary,
      ),
      title: Text(item.title),
      subtitle: Text(item.subTitle),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: colors.primary,
      ),
      onTap: () {
        // Navigator.pushNamed(context, item.link);
        // context.pushNamed(ButtonsScreen.name);
        context.push(item.link);
      },
    );
  }
}
