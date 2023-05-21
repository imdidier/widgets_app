import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.icon,
    required this.link,
    required this.subTitle,
    required this.title,
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    icon: Icons.smart_button,
    link: '/buttons',
    subTitle: 'Los botones en Flutter ',
    title: 'Botones',
  ),
  MenuItem(
    icon: Icons.credit_card,
    link: '/cards',
    subTitle: 'Las tarjetas en Flutter',
    title: 'Cards',
  ),
  MenuItem(
    icon: Icons.credit_card,
    link: '/progress',
    subTitle: 'Progress Indicators in Flutter generales y controlados',
    title: 'ProgressIndicators',
  ),
];
