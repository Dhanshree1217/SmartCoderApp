import 'dart:math';
import 'package:flutter/material.dart';
import '../user_data_manager.dart';
import 'quiz_data.dart';

// ── topics per language per level ──────────────────────────────────────────
const _quizTopics = {
  'Python': {
    'Beginner Level': [
      {'name': 'Hello World',  'icon': Icons.play_arrow},
      {'name': 'Variables',    'icon': Icons.storage},
      {'name': 'Data Types',   'icon': Icons.category},
      {'name': 'Input/Output', 'icon': Icons.keyboard},
      {'name': 'Operators',    'icon': Icons.calculate},
      {'name': 'Conditions',   'icon': Icons.device_hub},
      {'name': 'For Loop',     'icon': Icons.loop},
      {'name': 'While Loop',   'icon': Icons.replay},
      {'name': 'Lists',        'icon': Icons.view_list},
      {'name': 'Functions',    'icon': Icons.functions},
    ],
    'Intermediate Level': [
      {'name': 'String Methods',    'icon': Icons.text_fields},
      {'name': 'Dictionaries',      'icon': Icons.menu_book},
      {'name': 'Tuples & Sets',     'icon': Icons.layers},
      {'name': 'File Handling',     'icon': Icons.folder_open},
      {'name': 'Exception Handling','icon': Icons.warning_amber},
      {'name': 'Classes & Objects', 'icon': Icons.class_outlined},
      {'name': 'Inheritance',       'icon': Icons.account_tree},
      {'name': 'Modules',           'icon': Icons.extension},
    ],
    'Advanced Level': [
      {'name': 'Decorators',        'icon': Icons.auto_fix_high},
      {'name': 'Generators',        'icon': Icons.electric_bolt},
      {'name': 'Lambda Functions',  'icon': Icons.functions},
      {'name': 'List Comprehension','icon': Icons.list_alt},
      {'name': 'Regex',             'icon': Icons.search},
      {'name': 'Multithreading',    'icon': Icons.device_hub},
    ],
  },
  'Java': {
    'Beginner Level': [
      {'name': 'Hello World',   'icon': Icons.play_arrow},
      {'name': 'Variables',     'icon': Icons.storage},
      {'name': 'Data Types',    'icon': Icons.category},
      {'name': 'Operators',     'icon': Icons.calculate},
      {'name': 'Conditions',    'icon': Icons.device_hub},
      {'name': 'For Loop',      'icon': Icons.loop},
      {'name': 'While Loop',    'icon': Icons.replay},
      {'name': 'Arrays',        'icon': Icons.view_list},
      {'name': 'Methods',       'icon': Icons.functions},
      {'name': 'Scanner Input', 'icon': Icons.keyboard},
    ],
    'Intermediate Level': [
      {'name': 'Classes & Objects', 'icon': Icons.class_outlined},
      {'name': 'Constructors',      'icon': Icons.build},
      {'name': 'Inheritance',       'icon': Icons.account_tree},
      {'name': 'Interfaces',        'icon': Icons.settings_ethernet},
      {'name': 'Exception Handling','icon': Icons.warning_amber},
      {'name': 'ArrayList',         'icon': Icons.list},
      {'name': 'HashMap',           'icon': Icons.map},
      {'name': 'String Methods',    'icon': Icons.text_fields},
    ],
    'Advanced Level': [
      {'name': 'Generics',        'icon': Icons.code},
      {'name': 'Streams & Lambda','icon': Icons.water},
      {'name': 'Multithreading',  'icon': Icons.device_hub},
      {'name': 'File I/O',        'icon': Icons.folder_open},
      {'name': 'JDBC',            'icon': Icons.storage},
    ],
  },
  'C Language': {
    'Beginner Level': [
      {'name': 'Hello World',  'icon': Icons.play_arrow},
      {'name': 'Variables',    'icon': Icons.storage},
      {'name': 'Data Types',   'icon': Icons.category},
      {'name': 'Input/Output', 'icon': Icons.keyboard},
      {'name': 'Operators',    'icon': Icons.calculate},
      {'name': 'Conditions',   'icon': Icons.device_hub},
      {'name': 'For Loop',     'icon': Icons.loop},
      {'name': 'While Loop',   'icon': Icons.replay},
      {'name': 'Arrays',       'icon': Icons.view_list},
      {'name': 'Functions',    'icon': Icons.functions},
    ],
    'Intermediate Level': [
      {'name': 'Pointers',       'icon': Icons.arrow_forward},
      {'name': 'Strings',        'icon': Icons.text_fields},
      {'name': 'Structures',     'icon': Icons.layers},
      {'name': 'File Handling',  'icon': Icons.folder_open},
      {'name': 'Dynamic Memory', 'icon': Icons.memory},
      {'name': 'Recursion',      'icon': Icons.replay_circle_filled},
    ],
    'Advanced Level': [
      {'name': 'Linked Lists',    'icon': Icons.link},
      {'name': 'Stacks & Queues', 'icon': Icons.stacked_bar_chart},
      {'name': 'Bit Manipulation','icon': Icons.settings},
      {'name': 'Preprocessor',    'icon': Icons.code},
    ],
  },
  'HTML & CSS': {
    'Beginner Level': [
      {'name': 'HTML Basics',           'icon': Icons.code},
      {'name': 'Headings & Paragraphs', 'icon': Icons.text_fields},
      {'name': 'Links & Images',        'icon': Icons.link},
      {'name': 'Lists & Tables',        'icon': Icons.list},
      {'name': 'Forms',                 'icon': Icons.assignment},
      {'name': 'CSS Basics',            'icon': Icons.palette},
      {'name': 'Colors & Backgrounds',  'icon': Icons.color_lens},
      {'name': 'Box Model',             'icon': Icons.crop_square},
      {'name': 'Flexbox',               'icon': Icons.view_column},
      {'name': 'Responsive Design',     'icon': Icons.devices},
    ],
    'Intermediate Level': [
      {'name': 'CSS Grid',       'icon': Icons.grid_on},
      {'name': 'CSS Animations', 'icon': Icons.animation},
      {'name': 'CSS Variables',  'icon': Icons.tune},
      {'name': 'Semantic HTML',  'icon': Icons.layers},
      {'name': 'HTML5 APIs',     'icon': Icons.api},
      {'name': 'Media Queries',  'icon': Icons.phone_iphone},
    ],
    'Advanced Level': [
      {'name': 'CSS Preprocessors','icon': Icons.code},
      {'name': 'Web Accessibility','icon': Icons.accessibility},
      {'name': 'SEO Basics',       'icon': Icons.search},
    ],
  },
};

// ── QuizScreen ─────────────────────────────────────────────────────────────
class QuizScreen extends StatelessWidget {
  final String language;
  final String level;

  QuizScreen({required this.language, this.level = 'Beginner Level'});

  Color get _color {
    switch (language) {
      case 'Python':     return const Color(0xFF306998);
      case 'Java':       return const Color(0xFFF89820);
      case 'C Language': return const Color(0xFF00599C);
      case 'HTML & CSS': return const Color(0xFFE8431A);
      default:           return const Color(0xFFFF9800);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topics = (_quizTopics[language]?[level] ?? []);
    final color  = _color;

    return Scaffold(
      appBar: AppBar(
        title: Text('$language Quiz'),
        backgroundColor: color,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withAlpha(30), Colors.white],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.emoji_events, size: 55, color: color),
                  const SizedBox(height: 8),
                  Text(
                    '$level Topics',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text('Earn 5 points per correct answer!',
                      style: TextStyle(fontSize: 13, color: color)),
                ],
              ),
            ),
            Expanded(
              child: topics.isEmpty
                  ? const Center(child: Text('No topics available for this level.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: topics.length,
                      itemBuilder: (context, i) {
                        final name = topics[i]['name'] as String;
                        final icon = topics[i]['icon'] as IconData;
                        final hasQuestions = (quizData[language]?[level]?[name] ?? []).isNotEmpty;
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(14),
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: color.withAlpha(40),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(icon, color: color, size: 28),
                            ),
                            title: Text(name,
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                            subtitle: Text(
                              hasQuestions ? '${(quizData[language]?[level]?[name] ?? []).length} questions' : 'Coming soon',
                              style: TextStyle(color: hasQuestions ? Colors.green : Colors.grey),
                            ),
                            trailing: Icon(
                              hasQuestions ? Icons.play_arrow : Icons.lock_outline,
                              color: hasQuestions ? color : Colors.grey,
                            ),
                            onTap: hasQuestions
                                ? () => Navigator.push(context, MaterialPageRoute(
                                    builder: (_) => QuizQuestionsScreen(
                                      topic: name,
                                      language: language,
                                      level: level,
                                      color: color,
                                    ),
                                  ))
                                : null,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── QuizQuestionsScreen ────────────────────────────────────────────────────
class QuizQuestionsScreen extends StatefulWidget {
  final String topic;
  final String language;
  final String level;
  final Color color;

  QuizQuestionsScreen({
    required this.topic,
    required this.language,
    required this.level,
    required this.color,
  });

  @override
  State<QuizQuestionsScreen> createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  int _current = 0;
  int _score   = 0;
  String? _selected;
  bool _showFeedback = false;
  bool _isCorrect    = false;
  late List<Map<String, dynamic>> _shuffled;

  @override
  void initState() {
    super.initState();
    _shuffled = _buildShuffled();
  }

  List<Map<String, dynamic>> _buildShuffled() {
    final rng = Random();
    final raw = (quizData[widget.language]?[widget.level]?[widget.topic] ?? []);
    return raw.map((q) {
      final opts        = List<String>.from(q['options'] as List);
      final correctText = opts[q['correct'] as int];
      opts.shuffle(rng);
      return {
        'q':       q['q'],
        'options': opts,
        'correct': opts.indexOf(correctText),
      };
    }).toList();
  }

  List<Map<String, dynamic>> get _questions => _shuffled;

  void _check() {
    final q       = _questions[_current];
    final correct = q['options'][q['correct']];
    setState(() {
      _showFeedback = true;
      _isCorrect    = _selected == correct;
      if (_isCorrect) _score++;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (_current < _questions.length - 1) {
        setState(() { _current++; _selected = null; _showFeedback = false; });
      } else {
        _finish();
      }
    });
  }

  Future<void> _finish() async {
    await UserDataManager.saveQuizScore(widget.topic, _score, _questions.length);
    if (_score >= _questions.length * 0.6) {
      await UserDataManager.markTopicCompleted('${widget.language}_${widget.level}_${widget.topic}');
      await UserDataManager.addPoints(_score * 5);
    }
    await UserDataManager.updateStreak();
    await UserDataManager.checkAndUnlockAchievements();
    if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) => QuizResultScreen(
        topic: widget.topic,
        score: _score,
        total: _questions.length,
        pointsEarned: _score * 5,
        color: widget.color,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('${widget.topic} Quiz'), backgroundColor: widget.color),
        body: const Center(child: Text('No questions available yet!')),
      );
    }
    final q       = _questions[_current];
    final options = q['options'] as List;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDE7),
      appBar: AppBar(
        title: Text('${widget.topic} Quiz'),
        backgroundColor: widget.color,
        actions: [
          Center(child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('${_current + 1}/${_questions.length}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_current + 1) / _questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(widget.color),
            minHeight: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Question ${_current + 1}',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                        child: Text('Score: $_score',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(16)),
                    child: Text(q['q'] as String,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(options.length, (i) {
                    final opt          = options[i] as String;
                    final isSelected   = _selected == opt;
                    final isCorrectOpt = i == q['correct'];
                    Color btnColor     = Colors.white;
                    if (_showFeedback) {
                      if (isCorrectOpt) btnColor = const Color(0xFF4CAF50);
                      else if (isSelected) btnColor = const Color(0xFFFF4B4B);
                    } else if (isSelected) {
                      btnColor = widget.color.withAlpha(180);
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnColor,
                          foregroundColor: isSelected || (_showFeedback && isCorrectOpt)
                              ? Colors.white
                              : Colors.black87,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: widget.color, width: 1.5),
                          ),
                        ),
                        onPressed: _showFeedback ? null : () => setState(() => _selected = opt),
                        child: Row(
                          children: [
                            Container(
                              width: 32, height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Center(
                                child: Text(String.fromCharCode(65 + i),
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(child: Text(opt, style: const TextStyle(fontSize: 15))),
                            if (_showFeedback && isCorrectOpt)
                              const Icon(Icons.check_circle, color: Colors.white),
                            if (_showFeedback && isSelected && !_isCorrect)
                              const Icon(Icons.cancel, color: Colors.white),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.color,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: (_selected == null || _showFeedback) ? null : _check,
              child: const Text('CHECK',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── QuizResultScreen ───────────────────────────────────────────────────────
class QuizResultScreen extends StatelessWidget {
  final String topic;
  final int score;
  final int total;
  final int pointsEarned;
  final Color color;

  QuizResultScreen({
    required this.topic,
    required this.score,
    required this.total,
    required this.pointsEarned,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final pct    = (score / total * 100).toInt();
    final passed = pct >= 60;

    return Scaffold(
      backgroundColor: passed ? const Color(0xFF4CAF50) : const Color(0xFFFF9800),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(passed ? Icons.emoji_events : Icons.refresh, size: 100, color: Colors.white),
                const SizedBox(height: 16),
                Text(passed ? 'Congratulations!' : 'Keep Practicing!',
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text(topic, style: const TextStyle(fontSize: 16, color: Colors.white70)),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text('$score/$total',
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: passed ? const Color(0xFF4CAF50) : const Color(0xFFFF9800))),
                      Text('$pct%', style: TextStyle(fontSize: 22, color: Colors.grey[600])),
                      if (passed) ...[
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 28),
                            const SizedBox(width: 8),
                            Text('+$pointsEarned Points',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber)),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: color,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.home),
                        label: const Text('Home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: color,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
