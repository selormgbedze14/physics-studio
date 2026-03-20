// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../theme.dart';
import 'chapters_screen.dart';
import 'formula_sheet_screen.dart';
import 'quiz_home_screen.dart';
import 'past_papers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    ChaptersScreen(),
    FormulaSheetScreen(),
    QuizHomeScreen(),
    PastPapersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppTheme.border, width: 1)),
        ),
        child: NavigationBar(
          backgroundColor: AppTheme.surface,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) =>
              setState(() => _selectedIndex = index),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined, color: AppTheme.textMuted),
              selectedIcon: Icon(Icons.menu_book, color: AppTheme.accent),
              label: 'Notes',
            ),
            NavigationDestination(
              icon: Icon(Icons.functions_outlined, color: AppTheme.textMuted),
              selectedIcon: Icon(Icons.functions, color: AppTheme.accent),
              label: 'Formulas',
            ),
            NavigationDestination(
              icon: Icon(Icons.quiz_outlined, color: AppTheme.textMuted),
              selectedIcon: Icon(Icons.quiz, color: AppTheme.accent),
              label: 'Quiz',
            ),
            NavigationDestination(
              icon: Icon(Icons.history_edu_outlined, color: AppTheme.textMuted),
              selectedIcon: Icon(Icons.history_edu, color: AppTheme.accent),
              label: 'Past Papers',
            ),
          ],
        ),
      ),
    );
  }
}
