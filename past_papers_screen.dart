// lib/screens/past_papers_screen.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../data/physics_data.dart';
import '../models/models.dart';

class PastPapersScreen extends StatefulWidget {
  const PastPapersScreen({super.key});

  @override
  State<PastPapersScreen> createState() => _PastPapersScreenState();
}

class _PastPapersScreenState extends State<PastPapersScreen> {
  String _selectedTopic = 'All';
  String _selectedDifficulty = 'All';

  List<String> get _topics {
    final topics = {'All', ...pastPaperQuestions.map((q) => q.topic)};
    return topics.toList();
  }

  List<PastPaperQuestion> get _filtered {
    return pastPaperQuestions.where((q) {
      final topicMatch = _selectedTopic == 'All' || q.topic == _selectedTopic;
      final diffMatch = _selectedDifficulty == 'All' ||
          q.difficulty == _selectedDifficulty.toLowerCase();
      return topicMatch && diffMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text('Past Papers'),
        backgroundColor: AppTheme.surface,
      ),
      body: Column(
        children: [
          // Filters
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _FilterDropdown(
                    label: 'Topic',
                    value: _selectedTopic,
                    items: _topics,
                    onChanged: (v) => setState(() => _selectedTopic = v!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _FilterDropdown(
                    label: 'Difficulty',
                    value: _selectedDifficulty,
                    items: const ['All', 'Easy', 'Medium', 'Hard'],
                    onChanged: (v) =>
                        setState(() => _selectedDifficulty = v!),
                  ),
                ),
              ],
            ),
          ),

          // Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '${_filtered.length} question${_filtered.length != 1 ? 's' : ''}',
                  style: const TextStyle(
                      color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Questions
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              itemCount: _filtered.length,
              itemBuilder: (context, i) =>
                  _PaperQuestionCard(question: _filtered[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surface2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        dropdownColor: AppTheme.surface2,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.expand_more,
            color: AppTheme.textMuted, size: 18),
        items: items
            .map((t) => DropdownMenuItem(
                  value: t,
                  child: Text(t,
                      style: const TextStyle(
                          color: AppTheme.textPrimary, fontSize: 13)),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class _PaperQuestionCard extends StatefulWidget {
  final PastPaperQuestion question;
  const _PaperQuestionCard({required this.question});

  @override
  State<_PaperQuestionCard> createState() => _PaperQuestionCardState();
}

class _PaperQuestionCardState extends State<_PaperQuestionCard> {
  bool _showAnswer = false;

  Color get _difficultyColor {
    switch (widget.question.difficulty) {
      case 'easy':
        return AppTheme.green;
      case 'hard':
        return AppTheme.red;
      default:
        return AppTheme.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppTheme.accent.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(widget.question.year,
                          style: const TextStyle(
                              color: AppTheme.accent,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppTheme.surface3,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(widget.question.topic,
                          style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 11)),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _difficultyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: _difficultyColor.withOpacity(0.3)),
                      ),
                      child: Text(
                        widget.question.difficulty.toUpperCase(),
                        style: TextStyle(
                            color: _difficultyColor,
                            fontSize: 9,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.question.question,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          // Show/hide answer button
          InkWell(
            onTap: () => setState(() => _showAnswer = !_showAnswer),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_showAnswer ? 0 : 14),
                  bottomRight: Radius.circular(_showAnswer ? 0 : 14),
                ),
                border: const Border(
                    top: BorderSide(color: AppTheme.border)),
              ),
              child: Row(
                children: [
                  Icon(
                    _showAnswer
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppTheme.accent,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _showAnswer ? 'Hide Answer' : 'Show Full Answer',
                    style: const TextStyle(
                        color: AppTheme.accent,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(
                    _showAnswer ? Icons.expand_less : Icons.expand_more,
                    color: AppTheme.textMuted,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          // Answer
          if (_showAnswer)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.green.withOpacity(0.06),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                border: const Border(
                    top: BorderSide(color: AppTheme.border)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle_outline,
                          color: AppTheme.green, size: 14),
                      const SizedBox(width: 6),
                      const Text('WORKED ANSWER',
                          style: TextStyle(
                              color: AppTheme.green,
                              fontSize: 9,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.question.answer,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      color: AppTheme.green,
                      fontSize: 13,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
