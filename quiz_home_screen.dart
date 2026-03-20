// lib/screens/quiz_home_screen.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../data/physics_data.dart';
import '../models/models.dart';

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Group questions by chapter
    final Map<String, List<QuizQuestion>> byChapter = {};
    for (final q in allQuizQuestions) {
      byChapter.putIfAbsent(q.chapterId, () => []).add(q);
    }

    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: AppTheme.surface,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // All topics button
          _QuizTile(
            title: 'All Topics',
            subtitle: '${allQuizQuestions.length} questions · Mixed chapters',
            icon: '🎯',
            color: AppTheme.accent,
            onTap: () => _startQuiz(context, allQuizQuestions, 'All Topics'),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'BY CHAPTER',
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 10,
                letterSpacing: 2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...physicsChapters.map((ch) {
            final questions = byChapter[ch.id.toString()] ?? [];
            if (questions.isEmpty) return const SizedBox.shrink();
            final color = Color(
                int.parse('FF${ch.color.replaceAll('#', '')}', radix: 16));
            return _QuizTile(
              title: ch.title,
              subtitle: '${questions.length} question${questions.length > 1 ? 's' : ''}',
              icon: ch.icon,
              color: color,
              onTap: () => _startQuiz(context, questions, ch.title),
            );
          }),
        ],
      ),
    );
  }

  void _startQuiz(
      BuildContext context, List<QuizQuestion> questions, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizGameScreen(questions: questions, title: title),
      ),
    );
  }
}

class _QuizTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  const _QuizTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: AppTheme.surface2,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(icon,
                          style: const TextStyle(fontSize: 22))),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                      Text(subtitle,
                          style: const TextStyle(
                              color: AppTheme.textSecondary, fontSize: 12)),
                    ],
                  ),
                ),
                Icon(Icons.play_circle_outline, color: color, size: 26),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════
// QUIZ GAME SCREEN
// ═══════════════════════════════════════════════════
class QuizGameScreen extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String title;

  const QuizGameScreen({
    super.key,
    required this.questions,
    required this.title,
  });

  @override
  State<QuizGameScreen> createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _answered = false;
  bool _showExplanation = false;

  QuizQuestion get _current => widget.questions[_currentIndex];
  bool get _isLast => _currentIndex == widget.questions.length - 1;

  void _selectAnswer(int index) {
    if (_answered) return;
    setState(() {
      _selectedAnswer = index;
      _answered = true;
      if (index == _current.correctIndex) _score++;
    });
  }

  void _nextQuestion() {
    if (_isLast) {
      _showResults();
      return;
    }
    setState(() {
      _currentIndex++;
      _selectedAnswer = null;
      _answered = false;
      _showExplanation = false;
    });
  }

  void _showResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultScreen(
          score: _score,
          total: widget.questions.length,
          title: widget.title,
          onRetry: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => QuizGameScreen(
                    questions: widget.questions, title: widget.title),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(fontSize: 15)),
        backgroundColor: AppTheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.close, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '$_score / ${_currentIndex + (_answered ? 1 : 0)}',
                style: const TextStyle(
                    color: AppTheme.green, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppTheme.border,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppTheme.accent),
            minHeight: 3,
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Question number
                Text(
                  'Question ${_currentIndex + 1} of ${widget.questions.length}',
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),

                // Question
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.surface2,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Text(
                    _current.question,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Options
                ...List.generate(_current.options.length, (i) {
                  return _OptionButton(
                    label: ['A', 'B', 'C', 'D'][i],
                    text: _current.options[i],
                    state: _answered
                        ? (i == _current.correctIndex
                            ? _OptionState.correct
                            : i == _selectedAnswer
                                ? _OptionState.wrong
                                : _OptionState.disabled)
                        : _OptionState.normal,
                    onTap: () => _selectAnswer(i),
                  );
                }),

                // Explanation
                if (_answered) ...[
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => setState(
                        () => _showExplanation = !_showExplanation),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lightbulb_outline,
                              color: AppTheme.orange, size: 18),
                          const SizedBox(width: 8),
                          const Text('View Explanation',
                              style: TextStyle(
                                  color: AppTheme.orange, fontSize: 13)),
                          const Spacer(),
                          Icon(
                            _showExplanation
                                ? Icons.expand_less
                                : Icons.expand_more,
                            color: AppTheme.textMuted,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_showExplanation) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppTheme.orange.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppTheme.orange.withOpacity(0.3)),
                      ),
                      child: Text(
                        _current.explanation,
                        style: const TextStyle(
                          color: AppTheme.orange,
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accent,
                        foregroundColor: AppTheme.bg,
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        _isLast ? 'See Results' : 'Next Question →',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _OptionState { normal, correct, wrong, disabled }

class _OptionButton extends StatelessWidget {
  final String label;
  final String text;
  final _OptionState state;
  final VoidCallback onTap;

  const _OptionButton({
    required this.label,
    required this.text,
    required this.state,
    required this.onTap,
  });

  Color get _borderColor {
    switch (state) {
      case _OptionState.correct:
        return AppTheme.green;
      case _OptionState.wrong:
        return AppTheme.red;
      default:
        return AppTheme.border;
    }
  }

  Color get _bgColor {
    switch (state) {
      case _OptionState.correct:
        return AppTheme.green.withOpacity(0.1);
      case _OptionState.wrong:
        return AppTheme.red.withOpacity(0.1);
      default:
        return AppTheme.surface2;
    }
  }

  Color get _textColor {
    switch (state) {
      case _OptionState.correct:
        return AppTheme.green;
      case _OptionState.wrong:
        return AppTheme.red;
      case _OptionState.disabled:
        return AppTheme.textMuted;
      default:
        return AppTheme.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: _bgColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: state == _OptionState.normal ? onTap : null,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _borderColor),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: _borderColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: _borderColor.withOpacity(0.5)),
                  ),
                  child: Center(
                    child: Text(label,
                        style: TextStyle(
                            color: _borderColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(text,
                      style: TextStyle(
                          color: _textColor, fontSize: 14, height: 1.4)),
                ),
                if (state == _OptionState.correct)
                  const Icon(Icons.check_circle,
                      color: AppTheme.green, size: 20)
                else if (state == _OptionState.wrong)
                  const Icon(Icons.cancel, color: AppTheme.red, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════
// RESULTS SCREEN
// ═══════════════════════════════════════════════════
class QuizResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String title;
  final VoidCallback onRetry;

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.title,
    required this.onRetry,
  });

  double get _percentage => score / total * 100;

  String get _grade {
    if (_percentage >= 90) return 'A+';
    if (_percentage >= 80) return 'A';
    if (_percentage >= 70) return 'B';
    if (_percentage >= 60) return 'C';
    return 'F';
  }

  Color get _gradeColor {
    if (_percentage >= 80) return AppTheme.green;
    if (_percentage >= 60) return AppTheme.orange;
    return AppTheme.red;
  }

  String get _message {
    if (_percentage >= 90) return 'Outstanding! 🎉';
    if (_percentage >= 80) return 'Excellent work! 🌟';
    if (_percentage >= 70) return 'Good job! Keep going 👍';
    if (_percentage >= 60) return 'Almost there — review the topics 📖';
    return 'Keep studying — you\'ve got this! 💪';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Grade circle
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _gradeColor, width: 4),
                  color: _gradeColor.withOpacity(0.1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _grade,
                      style: TextStyle(
                          color: _gradeColor,
                          fontSize: 48,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '${_percentage.toStringAsFixed(0)}%',
                      style: TextStyle(
                          color: _gradeColor.withOpacity(0.7),
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                _message,
                style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '$score out of $total questions correct',
                style: const TextStyle(
                    color: AppTheme.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                    color: AppTheme.textMuted, fontSize: 13),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accent,
                    foregroundColor: AppTheme.bg,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Try Again',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () =>
                      Navigator.popUntil(context, (r) => r.isFirst),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.textSecondary,
                    side: const BorderSide(color: AppTheme.border),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Back to Home',
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
