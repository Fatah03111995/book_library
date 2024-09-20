import 'package:book_library/const/const.dart';
import 'package:flutter/material.dart';

class MenuNavBar extends StatelessWidget {
  final Function(int) changeIndex;
  final int activeIndex;
  const MenuNavBar(
      {super.key, required this.activeIndex, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    List<NavItem> navItems = [
      NavItem(name: 'Home', icon: Icons.home),
      NavItem(name: 'Favorite', icon: Icons.favorite),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(navItems.length, (index) {
        return Expanded(
            child: GestureDetector(
          onTap: () {
            changeIndex(index);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                navItems[index].icon,
                color: index == activeIndex ? Colors.black : Colors.white,
              ),
              const SizedBox(height: 5),
              if (index == activeIndex)
                Text(
                  navItems[index].name,
                  style: defaultTxt.copyWith(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 5),
            ],
          ),
        ));
      }),
    );
  }
}

class NavItem {
  final String name;
  final IconData icon;

  NavItem({required this.name, required this.icon});
}
