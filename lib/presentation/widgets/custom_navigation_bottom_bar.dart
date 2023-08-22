import 'package:flutter/material.dart';

class CustomNavigationBottomBar extends StatelessWidget {
  final Function(int) onPressed;
  final int pageIndex;

  const CustomNavigationBottomBar({
    super.key,
    required this.pageIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: onPressed,
      elevation: 0,
      backgroundColor: Colors.red,
      items: const [
        BottomNavigationBarItem(
          // tooltip: "tooltip",
          // activeIcon: Text("active"),
          // backgroundColor: Colors.transparent,
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
