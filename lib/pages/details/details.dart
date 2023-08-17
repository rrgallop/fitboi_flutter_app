import 'package:fitboi_app/pages/details/widgets/appbar.dart';
import 'package:fitboi_app/pages/details/widgets/dates.dart';
import 'package:fitboi_app/pages/details/widgets/graph.dart';
import 'package:fitboi_app/pages/details/widgets/info.dart';
import 'package:fitboi_app/pages/details/widgets/stats.dart';
import 'package:fitboi_app/pages/details/widgets/steps.dart';
import 'package:fitboi_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FitBoiAppBar(appBar: AppBar()),
      body: Column(
        children: [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Divider(height: 30),
          Stats(),
          SizedBox(height: 30),
          BottomNav()
        ]
      ),
    );
  }
}

