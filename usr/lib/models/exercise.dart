class Exercise {
  final String title;
  final String description;
  final String difficulty; // 'Easy', 'Medium', 'Hard'

  Exercise({required this.title, required this.description, required this.difficulty});

  static List<Exercise> getMockExercises(String subjectName) {
    // Mock exercises based on subject
    switch (subjectName) {
      case 'Math':
        return [
          Exercise(title: 'Basic Algebra', description: 'Solve simple equations', difficulty: 'Easy'),
          Exercise(title: 'Quadratic Equations', description: 'Solve quadratic equations', difficulty: 'Medium'),
          Exercise(title: 'Calculus Problems', description: 'Differentiate and integrate functions', difficulty: 'Hard'),
        ];
      case 'Physics':
        return [
          Exercise(title: 'Newton\'s Laws', description: 'Apply Newton\'s laws to problems', difficulty: 'Easy'),
          Exercise(title: 'Electricity Basics', description: 'Calculate current and voltage', difficulty: 'Medium'),
          Exercise(title: 'Quantum Mechanics', description: 'Solve quantum problems', difficulty: 'Hard'),
        ];
      case 'Biology':
        return [
          Exercise(title: 'Cell Structure', description: 'Identify cell organelles', difficulty: 'Easy'),
          Exercise(title: 'Photosynthesis', description: 'Explain the process of photosynthesis', difficulty: 'Medium'),
          Exercise(title: 'Genetics Problems', description: 'Solve inheritance problems', difficulty: 'Hard'),
        ];
      default:
        return [];
    }
  }
}