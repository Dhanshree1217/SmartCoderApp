import 'package:flutter/material.dart';
import 'practice_data.dart';

// ── topics per language per level ─────────────────────────────────────────
const _practiceTopics = {
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
      {'name': 'Exception Handling','icon': Icons.warning_amber},
      {'name': 'Classes & Objects', 'icon': Icons.class_outlined},
      {'name': 'Sorting',           'icon': Icons.sort},
      {'name': 'Recursion',         'icon': Icons.replay_circle_filled},
      {'name': 'List Comprehension','icon': Icons.list_alt},
      {'name': 'File Handling',     'icon': Icons.folder_open},
    ],
    'Advanced Level': [
      {'name': 'Binary Search',     'icon': Icons.search},
      {'name': 'Memoization',       'icon': Icons.memory},
      {'name': 'Stack',             'icon': Icons.stacked_bar_chart},
      {'name': 'Decorators',        'icon': Icons.auto_fix_high},
      {'name': 'Generators',        'icon': Icons.electric_bolt},
      {'name': 'Linked List',       'icon': Icons.link},
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
      {'name': 'Classes & OOP',     'icon': Icons.class_outlined},
      {'name': 'Inheritance',       'icon': Icons.account_tree},
      {'name': 'ArrayList',         'icon': Icons.list},
      {'name': 'Exception Handling','icon': Icons.warning_amber},
      {'name': 'Sorting',           'icon': Icons.sort},
      {'name': 'Recursion',         'icon': Icons.replay_circle_filled},
      {'name': 'String Methods',    'icon': Icons.text_fields},
      {'name': 'HashMap',           'icon': Icons.map},
    ],
    'Advanced Level': [
      {'name': 'Binary Search',  'icon': Icons.search},
      {'name': 'Stack',          'icon': Icons.stacked_bar_chart},
      {'name': 'Generics',       'icon': Icons.code},
      {'name': 'Streams',        'icon': Icons.water},
      {'name': 'Fibonacci DP',   'icon': Icons.memory},
      {'name': 'Multithreading', 'icon': Icons.device_hub},
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
      {'name': 'Recursion',      'icon': Icons.replay_circle_filled},
      {'name': 'Dynamic Memory', 'icon': Icons.memory},
      {'name': 'Sorting',        'icon': Icons.sort},
      {'name': 'File Handling',  'icon': Icons.folder_open},
    ],
    'Advanced Level': [
      {'name': 'Linked List',     'icon': Icons.link},
      {'name': 'Stack',           'icon': Icons.stacked_bar_chart},
      {'name': 'Binary Search',   'icon': Icons.search},
      {'name': 'Bit Manipulation','icon': Icons.settings},
      {'name': 'Fibonacci DP',    'icon': Icons.memory},
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
      {'name': 'CSS Animation',  'icon': Icons.animation},
      {'name': 'CSS Variables',  'icon': Icons.tune},
      {'name': 'Semantic HTML',  'icon': Icons.layers},
      {'name': 'Responsive Nav', 'icon': Icons.phone_iphone},
      {'name': 'HTML Table',     'icon': Icons.table_chart},
    ],
    'Advanced Level': [
      {'name': 'SCSS Mixin',       'icon': Icons.code},
      {'name': 'Accessible Form',  'icon': Icons.accessibility},
      {'name': 'SEO Meta Tags',    'icon': Icons.search},
    ],
  },
};

// ── map topic name → ProblemData ──────────────────────────────────────────
ProblemData? _findProblem(String language, String level, String topic) {
  final problems = practiceData[language]?[level] ?? [];
  try {
    return problems.firstWhere((p) => p.title == topic);
  } catch (_) {
    return problems.isNotEmpty ? problems.first : null;
  }
}

// ── PracticeScreen ─────────────────────────────────────────────────────────
class PracticeScreen extends StatelessWidget {
  final String language;
  final String level;

  PracticeScreen({required this.language, this.level = 'Beginner Level'});

  Color get _color {
    switch (language) {
      case 'Python':     return const Color(0xFF306998);
      case 'Java':       return const Color(0xFFF89820);
      case 'C Language': return const Color(0xFF00599C);
      case 'HTML & CSS': return const Color(0xFFE8431A);
      default:           return const Color(0xFF4CAF50);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topics = (_practiceTopics[language]?[level] ?? []);
    final color  = _color;

    return Scaffold(
      appBar: AppBar(
        title: Text('$language Practice'),
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
                  Icon(Icons.code, size: 50, color: color),
                  const SizedBox(height: 6),
                  Text('$level Topics',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text('Select a topic to practice coding',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                ],
              ),
            ),
            Expanded(
              child: topics.isEmpty
                  ? const Center(child: Text('No topics available.'))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: topics.length,
                      itemBuilder: (context, i) {
                        final name = topics[i]['name'] as String;
                        final icon = topics[i]['icon'] as IconData;
                        final problem = _findProblem(language, level, name);
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(14),
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: color.withAlpha(40),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(icon, color: color, size: 26),
                            ),
                            title: Text(name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            subtitle: problem != null
                                ? Text(problem.problem,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[500]))
                                : const Text('Coming soon',
                                    style: TextStyle(color: Colors.grey)),
                            trailing: Icon(
                              problem != null ? Icons.edit : Icons.lock_outline,
                              color: problem != null ? color : Colors.grey,
                            ),
                            onTap: problem != null
                                ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PracticeCodingScreen(
                                        problem: problem,
                                        language: language,
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

// ── PracticeCodingScreen ───────────────────────────────────────────────────
class PracticeCodingScreen extends StatefulWidget {
  final ProblemData problem;
  final String language;
  final Color color;

  const PracticeCodingScreen({
    required this.problem,
    required this.language,
    required this.color,
  });

  @override
  State<PracticeCodingScreen> createState() => _PracticeCodingScreenState();
}

class _PracticeCodingScreenState extends State<PracticeCodingScreen> {
  final _controller = TextEditingController();
  bool _showResult  = false;
  bool _isCorrect   = false;
  bool _showDetails = false;

  void _check() {
    final user    = _controller.text.trim().replaceAll(RegExp(r'\s+'), '');
    final correct = widget.problem.answer.trim().replaceAll(RegExp(r'\s+'), '');
    setState(() {
      _showResult = true;
      _isCorrect  = user.toLowerCase() == correct.toLowerCase();
    });
  }

  void _showAnswer() {
    setState(() {
      _controller.text = widget.problem.answer;
      _showResult = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _infoRow(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: widget.color)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.color.withAlpha(15),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: widget.color.withAlpha(60)),
          ),
          child: Text(value, style: const TextStyle(fontSize: 13, fontFamily: 'monospace')),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final p = widget.problem;

    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
        backgroundColor: widget.color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ── Problem Statement ──
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(children: [
                    Icon(Icons.assignment, color: Colors.white, size: 22),
                    SizedBox(width: 8),
                    Text('Problem Statement',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ]),
                  const SizedBox(height: 10),
                  Text(p.problem, style: const TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ── Toggle Details ──
            GestureDetector(
              onTap: () => setState(() => _showDetails = !_showDetails),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: widget.color, size: 20),
                    const SizedBox(width: 8),
                    const Text('Show Problem Details',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Icon(_showDetails ? Icons.expand_less : Icons.expand_more),
                  ],
                ),
              ),
            ),

            if (_showDetails) ...[
              const SizedBox(height: 10),
              _infoRow('Input Format:', p.inputFormat),
              _infoRow('Output Format:', p.outputFormat),
              _infoRow('Sample Input:', p.sampleInput),
              _infoRow('Expected Output:', p.sampleOutput),
              _infoRow('Explanation:', p.explanation),
            ],

            const SizedBox(height: 12),

            // ── Hint ──
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber, width: 1.5),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb, color: Colors.amber),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('Hint: ${p.hint}',
                        style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text('Write your code:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // ── Code Editor ──
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _controller,
                maxLines: 10,
                style: const TextStyle(
                    fontFamily: 'monospace', fontSize: 14, color: Colors.white),
                decoration: InputDecoration(
                  hintText: '// Write your solution here...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ── Buttons ──
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text('Submit', style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _check,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.visibility),
                    label: const Text('Show Answer', style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _showAnswer,
                  ),
                ),
              ],
            ),

            // ── Result ──
            if (_showResult) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: _isCorrect ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: _isCorrect ? Colors.green : Colors.red, width: 2),
                ),
                child: Column(
                  children: [
                    Icon(
                      _isCorrect ? Icons.check_circle : Icons.cancel,
                      size: 48,
                      color: _isCorrect ? Colors.green : Colors.red,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isCorrect ? '✅ Correct! Well Done!' : '❌ Not quite right, try again!',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: _isCorrect ? Colors.green : Colors.red),
                    ),
                    if (_isCorrect) ...[
                      const SizedBox(height: 6),
                      Text(p.explanation,
                          style: const TextStyle(fontSize: 13, color: Colors.black54),
                          textAlign: TextAlign.center),
                    ],
                    if (!_isCorrect) ...[
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Expected Answer:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(p.answer,
                            style: const TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 13,
                                color: Colors.white)),
                      ),
                      const SizedBox(height: 8),
                      Text('💡 ${p.explanation}',
                          style: const TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
