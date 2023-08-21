import 'dart:math';

import 'package:flutter/material.dart';

import '../../../models/recent_activity.dart';
import '../../../models/workout_program.dart';
import '../../../services/data_service.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({super.key});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {

  late Future<List<dynamic>> futureRecentActivities;

  @override initState() {
    super.initState();
    futureRecentActivities = constructRecentActivitiesList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Activities',
              style: Theme.of(context).textTheme.displayLarge
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: futureRecentActivities,
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return Text("No recent activites available");
                  } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) { 
                          if (snapshot.data != null) {
                            RecentActivity recentActivity = RecentActivity.fromJson(snapshot.data![index]);
                            return ActivityItem(
                              program: recentActivity.programType,
                              activityDuration: recentActivity.workoutDuration,
                              caloriesBurned: recentActivity.caloriesBurned,
                              workoutImage: recentActivity.workoutImage,
                              workoutName: recentActivity.workoutName
                            );
                          }
                        },
                      );
                  }
                }
              ),
            )
          ],
        ),
      )
    );
  }
}

class ActivityItem extends StatelessWidget {
  final ProgramType program;
  final String activityDuration;
  final String caloriesBurned;
  final AssetImage workoutImage;
  final String workoutName;
  const ActivityItem({
    super.key,
    required this.program,
    required this.activityDuration,
    required this.caloriesBurned,
    required this.workoutImage,
    required this.workoutName
    });



  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/details');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffe1e1e1)),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffcff2ff)
              ),
              height: 35,
              width: 35,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: workoutImage,
                    fit: BoxFit.fill
                  ),
                  
                ),
                height: 25,
                width: 25
              )
            ),
            SizedBox(width: 20),
            Text(
              workoutName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900
              )
            ),
            Expanded(child: SizedBox()),
            Icon(Icons.timer, size: 12),
            SizedBox(width: 5),
            Text(
              activityDuration,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
            SizedBox(width: 10),
            Icon(Icons.wb_sunny_outlined, size: 12),
            SizedBox(width: 5),
            Text(
              caloriesBurned,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
            SizedBox(width:20)
          ],
        )
      ),
    );
  }
}

Future<List<dynamic>> constructRecentActivitiesList(){
  final apiService = ApiService();
  Future<List<dynamic>> response = apiService.fetchRecentActivities();

  return response;
}