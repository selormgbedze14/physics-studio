// lib/screens/formula_sheet_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme.dart';
import '../data/physics_data.dart';
import '../models/models.dart';

class FormulaSheetScreen extends StatefulWidget {
  const FormulaSheetScreen({super.key});

  @override
  State<FormulaSheetScreen> createState() => _FormulaSheetScreenState();
}

class _FormulaSheetScreenState extends State<FormulaSheetScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _filterFormulas();

    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text('Formula Sheet'),
        backgroundColor: AppTheme.surface,
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v.toLowerCase()),
              style: const TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: 'Search formulas...',
                hintStyle:
                    const TextStyle(color: AppTheme.textMuted),
                prefixIcon:
                    const Icon(Icons.search, color: AppTheme.textMuted),
                filled: true,
                fillColor: AppTheme.surface2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: AppTheme.accent, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
              ),
            ),
          ),

          // Formula list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final entry = filtered[i];
                return _FormulaSectionBlock(
                  category: entry.key,
                  formulas: entry.value,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<MapEntry<String, List<Formula>>> _filterFormulas() {
    if (_searchQuery.isEmpty) return formulaSheet.entries.toList();

    final result = <MapEntry<String, List<Formula>>>[];
    for (final entry in formulaSheet.entries) {
      final matching = entry.value.where((f) {
        return f.name.toLowerCase().contains(_searchQuery) ||
            f.expression.toLowerCase().contains(_searchQuery) ||
            f.variables.toLowerCase().contains(_searchQuery);
      }).toList();
      if (matching.isNotEmpty || entry.key.toLowerCase().contains(_searchQuery)) {
        result.add(MapEntry(entry.key, matching.isEmpty ? entry.value : matching));
      }
    }
    return result;
  }
}

class _FormulaSectionBlock extends StatelessWidget {
  final String category;
  final List<Formula> formulas;

  const _FormulaSectionBlock({
    required this.category,
    required this.formulas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            category.toUpperCase(),
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 10,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ...formulas.map((f) => _FormulaRow(formula: f)),
        const SizedBox(height: 8),
        const Divider(color: AppTheme.border),
      ],
    );
  }
}

class _FormulaRow extends StatelessWidget {
  final Formula formula;
  const _FormulaRow({required this.formula});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surface2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formula.name,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  formula.expression,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: AppTheme.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (formula.variables.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      formula.variables,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: AppTheme.textMuted, size: 18),
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: '${formula.name}: ${formula.expression}'));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Copied: ${formula.expression}'),
                  backgroundColor: AppTheme.surface3,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
