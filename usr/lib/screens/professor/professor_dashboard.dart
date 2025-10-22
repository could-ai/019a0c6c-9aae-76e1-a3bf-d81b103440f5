import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class ProfessorDashboard extends StatelessWidget {
  const ProfessorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Professor Dashboard - ${authProvider.userName}'),
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
          const Text('Student Analytics:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('View Student Progress'),
              subtitle: const Text('See which subjects students are struggling with'),
              onTap: () => _showAnalyticsDialog(context),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Manage Exercises'),
              subtitle: const Text('Add or modify exercises for subjects'),
              onTap: () => _showManageDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  void _showAnalyticsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Student Analytics'),
        content: const Text('Detailed analytics will be available with backend integration.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  void _showManageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Manage Exercises'),
        content: const Text('Exercise management will be available with backend integration.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }
}