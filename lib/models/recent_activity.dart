import 'package:fitboi_app/models/workout_program.dart';
import 'package:flutter/material.dart';

class RecentActivity {
  final ProgramType programType;
  final String workoutDuration;
  final String caloriesBurned;
  final AssetImage workoutImage;
  final String workoutName;

  RecentActivity({
    required this.programType,
    required this.workoutDuration,
    required this.caloriesBurned,
    required this.workoutImage,
    required this.workoutName
  });

  factory RecentActivity.fromJson(dynamic json){
    try {
      ProgramType programType = getProgramType(json["programType"]);
      
      return RecentActivity(
        programType: programType,
        workoutDuration: json["activityDuration"],
        caloriesBurned: json["caloriesBurned"],
        workoutImage: AssetImage(json["assetImageName"]),
        workoutName: json["workoutName"]
      );
    }
    catch(Exception) {
      return RecentActivity(
        programType: ProgramType.unassigned, 
        workoutDuration: "0min", 
        caloriesBurned: "0kcal", 
        workoutImage: AssetImage("assets/runner.jpg"), 
        workoutName: "unassigned"
      );
    }

  }
  
}