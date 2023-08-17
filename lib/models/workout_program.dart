import 'package:flutter/material.dart';
import 'package:fitboi_app/services/data_service.dart'; 

enum ProgramType {
  cardio,
  strength,
}

class WorkoutProgram {
  final AssetImage image;
  final String workoutName;
  final String calories;
  final String workoutDuration;
  final ProgramType programType;

  WorkoutProgram({
    required this.image, 
    required this.workoutName,
    required this.calories,
    required this.workoutDuration,
    required this.programType,
  });


}

// until this is hooked up to a backend, this represents our "database"
// it's just some default values we can load into the UI
// final List<WorkoutProgram> workoutPrograms = [
//   WorkoutProgram(
//     image: AssetImage('assets/gym.jpg'),
//     workoutName: 'Strength Workout',
//     calories: '132kcal',
//     workoutDuration: '45min' ,
//     programType: ProgramType.strength,
//   ),
//   WorkoutProgram(
//     image: AssetImage('assets/runner.jpg'),
//     workoutName: 'Cardio Workout',
//     calories: '232kcal',
//     workoutDuration: '25min',
//     programType: ProgramType.cardio,
//   )
// ];


