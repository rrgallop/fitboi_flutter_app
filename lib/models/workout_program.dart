import 'package:flutter/material.dart';
import 'package:fitboi_app/services/data_service.dart'; 

enum ProgramType {
  cardio,
  running,
  strength,
  mbiking,
  cycling,
  plyometrics,
  yoga,
  stretching,
  swimming,
  walking,
  unassigned
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

  factory WorkoutProgram.fromJson(Map<String, dynamic> json){
    ProgramType thisProgramType = getProgramType(json["programType"]);
    
    return WorkoutProgram(
      image: AssetImage(json["assetImageName"]),
      workoutName: json["workoutName"],
      workoutDuration: "",
      calories: "",
      programType: thisProgramType
    );
  }
  
}

ProgramType getProgramType(String inProgramType) {
  ProgramType thisProgramType = ProgramType.unassigned;
  String programTypeString = inProgramType;

  switch(programTypeString) {
    case "strength":
      thisProgramType = ProgramType.strength;
      break;
    case "running":
      thisProgramType = ProgramType.running;
      break;
    case "cardio":
      thisProgramType = ProgramType.cardio;
      break;
    case "plyometrics":
      thisProgramType = ProgramType.plyometrics;
      break;
    case "mbiking":
      thisProgramType = ProgramType.mbiking;
      break;
    case "walking":
      thisProgramType = ProgramType.walking;
      break;
    case "swimming":
      thisProgramType = ProgramType.swimming;
      break;
    case "stretching":
      thisProgramType = ProgramType.stretching;
      break;
    case "cycling":
      thisProgramType = ProgramType.cycling;
      break;
  }

  return thisProgramType;
}