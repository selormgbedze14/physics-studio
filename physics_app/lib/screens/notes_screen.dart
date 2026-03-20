// lib/screens/notes_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../theme.dart';
import '../models/models.dart';

class NotesScreen extends StatefulWidget {
  final Topic topic;
  final Chapter chapter;
  final Color accentColor;

  const NotesScreen({
    super.key,
    required this.topic,
    required this.chapter,
    required this.accentColor,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _sectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.topic.sections.length,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() => _sectionIndex = _tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final section = widget.topic.sections[_sectionIndex];

    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: Text(widget.topic.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        backgroundColor: AppTheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: widget.topic.sections.length > 1
            ? TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: widget.accentColor,
                labelColor: widget.accentColor,
                unselectedLabelColor: AppTheme.textMuted,
                labelStyle: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600),
                tabs: widget.topic.sections
                    .map((s) => Tab(text: s.title))
                    .toList(),
              )
            : null,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Section header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.accentColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: widget.accentColor.withOpacity(0.2)),
            ),
            child: Text(
              section.title,
              style: TextStyle(
                color: widget.accentColor,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Markdown content
          _MarkdownCard(
            content: section.content,
            accentColor: widget.accentColor,
          ),

          // Formula cards
          if (section.formulas.isNotEmpty) ...[
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.functions, color: widget.accentColor, size: 16),
                const SizedBox(width: 8),
                Text(
                  'KEY FORMULAS',
                  style: TextStyle(
                    color: widget.accentColor,
                    fontSize: 10,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...section.formulas.map((f) => _FormulaCard(
                  formula: f,
                  accentColor: widget.accentColor,
                )),
          ],

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _MarkdownCard extends StatelessWidget {
  final String content;
  final Color accentColor;

  const _MarkdownCard({required this.content, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: MarkdownBody(
        data: content,
        styleSheet: MarkdownStyleSheet(
          h2: TextStyle(
            color: accentColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          h3: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          p: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            height: 1.7,
          ),
          strong: const TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          blockquote: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
          blockquoteDecoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: BorderRadius.circular(4),
            border: Border(
              left: BorderSide(color: accentColor, width: 3),
            ),
          ),
          code: const TextStyle(
            fontFamily: 'monospace',
            color: AppTheme.green,
            backgroundColor: Color(0xFF0D2818),
            fontSize: 13,
          ),
          tableHead: const TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          tableBody: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 12,
          ),
          tableBorder: TableBorder.all(
            color: AppTheme.border,
            width: 1,
          ),
          tableHeadAlign: TextAlign.left,
          listBullet: TextStyle(color: accentColor),
        ),
      ),
    );
  }
}

class _FormulaCard extends StatelessWidget {
  final Formula formula;
  final Color accentColor;

  const _FormulaCard({required this.formula, required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: BorderSide(color: accentColor, width: 3),
          top: const BorderSide(color: AppTheme.border),
          right: const BorderSide(color: AppTheme.border),
          bottom: const BorderSide(color: AppTheme.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            formula.name.toUpperCase(),
            style: TextStyle(
              color: accentColor.withOpacity(0.8),
              fontSize: 9,
              letterSpacing: 1.8,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          // Expression
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.07),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              formula.expression,
              style: const TextStyle(
                fontFamily: 'monospace',
                color: AppTheme.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          // Variables
          if (formula.variables.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              formula.variables,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
          // Example
          if (formula.example != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.surface2,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb_outline,
                      color: AppTheme.orange, size: 14),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      formula.example!,
                      style: const TextStyle(
                        color: AppTheme.orange,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
