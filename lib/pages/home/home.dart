import 'package:fitboi_app/pages/home/widgets/activity.dart';
import 'package:fitboi_app/pages/home/widgets/current.dart';
import 'package:fitboi_app/pages/home/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
    
        children: [
          AppHeader(),
          CurrentPrograms(),
          RecentActivities(),
          BottomNav()
        ]
      ),
    );
  }

}