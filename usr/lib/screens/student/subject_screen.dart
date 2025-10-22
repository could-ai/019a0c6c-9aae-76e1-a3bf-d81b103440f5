import 'package:flutter/material.dart';
import '../../models/subject.dart';
import '../../models/exercise.dart';

class SubjectScreen extends StatelessWidget {
  final Subject subject;

  const SubjectScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final exercises = Exercise.getMockExercises(subject.name);

    return Scaffold(
      appBar: AppBar(title: Text(subject.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return Card(
                  child: ListTile(
                    title: Text(exercise.title),
                    subtitle: Text('Difficulty: ${exercise.difficulty}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => _showExerciseDialog(context, exercise),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VisualizationScreen(subject: subject)),
              ),
              icon: const Icon(Icons.view_in_ar),
              label: const Text('3D Visualization'),
            ),
          ),
        ],
      ),
    );
  }

  void _showExerciseDialog(BuildContext context, Exercise exercise) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(exercise.title),
        content: Text(exercise.description),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }
}

class VisualizationScreen extends StatelessWidget {
  final Subject subject;

  const VisualizationScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${subject.name} 3D Visualization')),
      body: const Center(
        child: Text('3D visualization will be implemented with appropriate packages.'),
      ),
    );
  }
}