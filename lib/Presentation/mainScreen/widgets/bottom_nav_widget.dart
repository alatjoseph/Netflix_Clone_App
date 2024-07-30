import 'package:flutter/material.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class Bottom_Nav_Widget extends StatelessWidget {
  const Bottom_Nav_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, newindex, _) {
        return BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: newindex,
          onTap: (index) {
            indexNotifier.value=index;
            
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: 'New & Hot',
              backgroundColor: Colors.transparent,
            ),
           
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
              backgroundColor: Colors.transparent,
            ),
          ],
        );
      },
    );
  }
}
