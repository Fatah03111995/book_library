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
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 40,
                height: 30,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: index == activeIndex
                        ? Colors.white.withOpacity(0.3)
                        : Colors.transparent,
                    blurRadius: 3,
                  )
                ], borderRadius: BorderRadius.circular(10)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    navItems[index].icon,
                    color: index == activeIndex
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                  ),
                  if (index == activeIndex) const SizedBox(height: 5),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: index == activeIndex ? null : 0,
                    height: index == activeIndex ? null : 0,
                    child: Text(
                      navItems[index].name,
                      textAlign: TextAlign.center,
                      style: defaultTxt.copyWith(
                        letterSpacing: 2,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
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
