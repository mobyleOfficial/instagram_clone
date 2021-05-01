import 'package:flutter/widgets.dart';

class BottomNavigationTab {
  const BottomNavigationTab(
     this.bottomNavigationBarItem,
     this.navigatorKey,
     this.initialRouteName,
  );

  final BottomNavigationBarItem bottomNavigationBarItem;
  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRouteName;
}
