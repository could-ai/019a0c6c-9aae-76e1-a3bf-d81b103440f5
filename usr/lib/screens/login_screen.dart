import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  bool _isProfessor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'User Name'),
                validator: (value) => value!.isEmpty ? 'Please enter a user name' : null,
                onSaved: (value) => _userName = value!,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('I am a:'),
                  Radio<bool>(
                    value: false,
                    groupValue: _isProfessor,
                    onChanged: (value) => setState(() => _isProfessor = value!),
                  ),
                  const Text('Student'),
                  Radio<bool>(
                    value: true,
                    groupValue: _isProfessor,
                    onChanged: (value) => setState(() => _isProfessor = value!),
                  ),
                  const Text('Professor'),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<AuthProvider>(context, listen: false).login(_isProfessor, _userName);
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}