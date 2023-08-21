
import 'package:flutter/material.dart';

import '../../../models/workout_program.dart';
import '../../../services/data_service.dart';

class CurrentPrograms extends StatefulWidget {

  const CurrentPrograms({super.key});

  @override
  State<CurrentPrograms> createState() => _CurrentProgramsState();
}

class _CurrentProgramsState extends State<CurrentPrograms> {
  
  late Future<List<dynamic>> futureWorkoutPrograms;
  ProgramType active = ProgramType.unassigned;
  @override
  void initState() {
    super.initState();
    futureWorkoutPrograms = constructWorkoutProgramsList();
    
  }
  void _toggleProgram(ProgramType newType) {
    setState(() {
      if (newType == active){
        active = ProgramType.unassigned;
      } else {
        active = newType;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder<List<dynamic>>(
            future: futureWorkoutPrograms,
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text("No workout programs available");
              } else {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    WorkoutProgram displayProgram = WorkoutProgram.fromJson(snapshot.data![index]);
                    return ExerciseProgram(
                      program: displayProgram,
                      isActive: displayProgram.programType == active,
                      onTap: _toggleProgram
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                );
              }
            }
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
            color: isActive ? Colors.black54 : Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(program.workoutName),
            ],
          ),
        )
      ),
    );
  }
}

Future<List<dynamic>> constructWorkoutProgramsList() {
  final apiService = ApiService();
  Future<List<dynamic>> response = apiService.fetchWorkoutPrograms();
  
  return response;
}