import 'package:flutter/material.dart';

import '../../../models/workout_program.dart';
import '../../../services/data_service.dart';

class CurrentPrograms extends StatefulWidget {

  const CurrentPrograms({super.key});

  @override
  State<CurrentPrograms> createState() => _CurrentProgramsState();
}

class _CurrentProgramsState extends State<CurrentPrograms> {
  
  late Future<List<WorkoutProgram>> futureWorkoutPrograms;
  late List<WorkoutProgram> wahahah;
  ProgramType active = ProgramType.cardio;
  @override
  void initState() {
    super.initState();
    futureWorkoutPrograms = constructWorkoutProgramsList();
  }
  void _toggleProgram(ProgramType newType) {
    setState(() {
      active = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // for current programs list
    List workoutPrograms = [];
    

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current programs', 
                style: Theme.of(context).textTheme.displayLarge
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15
              ),
            ]),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: workoutPrograms.length,
            itemBuilder: (context, index) {
              return ExerciseProgram(
                program: workoutPrograms[index],
                isActive: workoutPrograms[index].programType == active,
                onTap: _toggleProgram
              );
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 20),
          )
        )
      ]
    );
  }
}

class ExerciseProgram extends StatelessWidget {
  final WorkoutProgram program;
  final bool isActive;
  final Function(ProgramType) onTap;

  const ExerciseProgram({
    super.key, 
    required this.program, 
    this.isActive = false, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(program.programType);
      },
      child: Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              isActive ? Color(0xff1ebdf8).withOpacity(.8) 
               : Colors.white.withOpacity(.8),
               BlendMode.lighten
            ),
            image: program.image,
            fit: BoxFit.cover,
          )
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(15),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(program.workoutName),
              Row(
                children: [
                  Text(program.calories),
                  SizedBox(width: 15),
                  Icon(
                    Icons.timer, 
                    color: isActive ? Colors.white : Colors.black, 
                    size: 10
                  ),
                  SizedBox(width: 5),
                  Text(program.workoutDuration)
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

Future<List<WorkoutProgram>> constructWorkoutProgramsList() async{
  List<WorkoutProgram> programs = [];
  final apiService = ApiService();
  List<dynamic> response = await apiService.fetchWorkoutPrograms();
  print(response.runtimeType);
  return programs;
}