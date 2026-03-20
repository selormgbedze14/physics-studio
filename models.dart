// lib/models/models.dart

class Chapter {
  final int id;
  final String title;
  final String icon;
  final String color;
  final List<Topic> topics;

  const Chapter({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.topics,
  });
}

class Topic {
  final String id;
  final String title;
  final List<Section> sections;

  const Topic({
    required this.id,
    required this.title,
    required this.sections,
  });
}

class Section {
  final String title;
  final String content; // markdown
  final List<Formula> formulas;

  const Section({
    required this.title,
    required this.content,
    this.formulas = const [],
  });
}

class Formula {
  final String name;
  final String expression;
  final String variables;
  final String? example;

  const Formula({
    required this.name,
    required this.expression,
    required this.variables,
    this.example,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String chapterId;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.chapterId,
  });
}

class PastPaperQuestion {
  final String year;
  final String question;
  final String answer;
  final String topic;
  final String difficulty; // 'easy' | 'medium' | 'hard'

  const PastPaperQuestion({
    required this.year,
    required this.question,
    required this.answer,
    required this.topic,
    required this.difficulty,
  });
}

class QuizResult {
  final String chapterId;
  final int score;
  final int total;
  final DateTime date;

  const QuizResult({
    required this.chapterId,
    required this.score,
    required this.total,
    required this.date,
  });

  double get percentage => score / total * 100;
}
