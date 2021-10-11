import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget implements PreferredSizeWidget {
  final double standardTextFontSize;

  const AppFooter({Key? key, this.standardTextFontSize = 0.0})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    const icons = [
      Icon(Icons.insert_drive_file_rounded),
      Icon(Icons.flash_on_rounded),
      Icon(Icons.notifications_outlined),
      Icon(Icons.menu_rounded)
    ];

    const labels = ['Документи', 'Послуги', 'Повідомлення', 'Меню'];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconSize: 30,
      items: [
        for (var i = 0; i < icons.length; i++) ...{
          BottomNavigationBarItem(
            icon: icons[i],
            label: labels[i],
          ),
        }
      ],
      selectedLabelStyle: TextStyle(fontSize: standardTextFontSize),
      unselectedLabelStyle: TextStyle(fontSize: standardTextFontSize),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    );
  }
}
