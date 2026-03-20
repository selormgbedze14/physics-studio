// lib/screens/topic_screen.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/models.dart';
import 'notes_screen.dart';

class TopicScreen extends StatelessWidget {
  final Chapter chapter;
  const TopicScreen({super.key, required this.chapter});

  Color get _accentColor {
    final hex = chapter.color.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: Text(chapter.title),
        backgroundColor: AppTheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Chapter header card
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _accentColor.withOpacity(0.15),
                  _accentColor.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _accentColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Text(chapter.icon, style: const TextStyle(fontSize: 40)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chapter ${chapter.id}',
                        style: TextStyle(
                          color: _accentColor.withOpacity(0.8),
                          fontSize: 11,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chapter.title,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Topics
          const Text(
            'TOPICS',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 10,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          ...chapter.topics.map((topic) => _TopicTile(
                topic: topic,
                chapter: chapter,
                accentColor: _accentColor,
              )),
        ],
      ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  final Topic topic;
  final Chapter chapter;
  final Color accentColor;

  const _TopicTile({
    required this.topic,
    required this.chapter,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: AppTheme.surface2,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NotesScreen(
                topic: topic,
                chapter: chapter,
                accentColor: accentColor,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.article_outlined,
                      color: accentColor, size: 18),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic.title,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${topic.sections.length} section${topic.sections.length > 1 ? 's' : ''}',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right,
                    color: accentColor.withOpacity(0.6), size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
