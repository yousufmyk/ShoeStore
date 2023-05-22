import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/Controllers/mainScreen_provider.dart';
import 'package:shoe_store/Views/Shared/ui/cartPage.dart';
import 'package:shoe_store/Views/Shared/ui/homePage.dart';
import 'package:shoe_store/Views/Shared/ui/profilePgae.dart';
import 'package:shoe_store/Views/Shared/ui/searchPage.dart';

import '../appstyle.dart';
import '../bottom_Nav_Bar.dart';
import '../bottom_nav_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Widget> pageList = const[
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Consumer<MainScreenNotifier>(

     builder: (context, mainScreenNotifier, child) {
       return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
    
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: BottomNavBar(),
        
      );
     },
    );
  }
}

