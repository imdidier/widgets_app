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
    icon: Icons.refresh,
    link: '/progress',
    subTitle: 'Progress Indicators in Flutter generales y controlados',
    title: 'ProgressIndicators',
  ),
  MenuItem(
    icon: Icons.info_outline,
    link: '/snackbars',
    subTitle: 'Indicadores en pantalla',
    title: 'Snackbars y diálogos',
  ),
  MenuItem(
    icon: Icons.check_box_outline_blank,
    link: '/animated-container',
    subTitle: 'Container animado',
    title: 'Animated container',
  ),
  MenuItem(
    icon: Icons.car_crash_outlined,
    link: '/ui-controls',
    subTitle: 'Controles de Flutter',
    title: 'UI controls + Titles',
  ),
  MenuItem(
    icon: Icons.recommend_outlined,
    link: '/app-tutorial',
    subTitle: 'Tutorial introductorio a un app',
    title: 'Introducción a la aplicación',
  ),
  MenuItem(
    icon: Icons.list_alt_outlined,
    link: '/infinite-scroll',
    subTitle: 'Listas infinitas y pull to refresh',
    title: 'Scroll infinito ',
  ),
];
