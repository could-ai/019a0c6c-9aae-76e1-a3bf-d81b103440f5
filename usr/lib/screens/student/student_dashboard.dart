import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/subject.dart';
import 'subject_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final subjects = Subject.getMockSubjects(); // Mock data for now

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${authProvider.userName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Your Subjects:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...subjects.map((subject) => Card(
            child: ListTile(
              title: Text(subject.name),
              subtitle: Text(subject.description),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubjectScreen(subject: subject)),
              ),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAIAssistant(context),
        tooltip: 'AI Assistant',
        child: const Icon(Icons.smart_toy),
      ),
    );
  }

  void _showAIAssistant(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI Assistant'),
        content: const Text('AI suggestions will be implemented with backend integration.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }
}