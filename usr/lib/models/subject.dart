class Subject {
  final String name;
  final String description;

  Subject({required this.name, required this.description});

  static List<Subject> getMockSubjects() {
    return [
      Subject(name: 'Math', description: 'Mathematics exercises and concepts'),
      Subject(name: 'Physics', description: 'Physics principles and problems'),
      Subject(name: 'Biology', description: 'Biological systems and processes'),
    ];
  }
}