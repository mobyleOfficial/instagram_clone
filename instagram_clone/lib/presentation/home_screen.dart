import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/presentation/common/bottom_navigation/bottom_navigation_scaffold.dart';
import 'package:instagram_clone/presentation/common/bottom_navigation/bottom_navigation_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BottomNavigationTab>? _navigationBarItems;

  @override
  void didChangeDependencies() {
    _navigationBarItems ??= [
      BottomNavigationTab(
        const BottomNavigationBarItem(
          label: '',
          activeIcon: IconTheme(
            data: IconThemeData(color: Colors.black),
            child: Icon(Icons.home_filled),
          ),
          icon: Icon(Icons.home_outlined),
        ),
        GlobalKey<NavigatorState>(),
        'photo_list',
      ),
      BottomNavigationTab(
        const BottomNavigationBarItem(
          label: '',
          activeIcon: IconTheme(
            data: IconThemeData(color: Colors.black),
            child: Icon(Icons.search_rounded),
          ),
          icon: Icon(Icons.search_outlined),
        ),
        GlobalKey<NavigatorState>(),
        'photo_list',
      ),
      BottomNavigationTab(
        const BottomNavigationBarItem(
          label: '',
          activeIcon: IconTheme(
            data: IconThemeData(color: Colors.black),
            child: Icon(Icons.store),
          ),
          icon: Icon(Icons.store_outlined),
        ),
        GlobalKey<NavigatorState>(),
        'photo_list',
      ),
      BottomNavigationTab(
        const BottomNavigationBarItem(
          label: '',
          activeIcon: IconTheme(
            data: IconThemeData(color: Colors.black),
            child: Icon(Icons.shopping_bag),
          ),
          icon: Icon(Icons.shopping_bag_outlined),
        ),
        GlobalKey<NavigatorState>(),
        'photo_list',
      ),
      BottomNavigationTab(
        const BottomNavigationBarItem(
          label: '',
          activeIcon: IconTheme(
            data: IconThemeData(color: Colors.black),
            child: Icon(Icons.mouse_rounded),
          ),
          icon: Icon(Icons.mouse_outlined),
        ),
        GlobalKey<NavigatorState>(),
        'photo_list',
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => BottomNavigationScaffold(
        _navigationBarItems ?? [],
      );
}
