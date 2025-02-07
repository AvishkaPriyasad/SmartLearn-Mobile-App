import 'package:flutter/material.dart';
import '/models/questions.dart';
import '/screens/programming_course_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;
    final double percentage = (score / totalQuestions) * 100;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Quiz Results',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 4,
          ),
        ),
        backgroundColor: Color(0xFF674AEF),
        iconTheme: IconThemeData(color: Colors.white, size: 25),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '✨ Congratulations! ✨',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF674AEF),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              'Your Score:',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w500,
              ),
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / totalQuestions,
                    color: Colors.lightGreenAccent,
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$score/$totalQuestions',
                      style: const TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${percentage.round()}%',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatBox(
                  label: 'Total Questions',
                  value: '$totalQuestions',
                  color: Color(0xFFF5F3FF),
                  textColor: Colors.black,
                ),
                _buildStatBox(
                  label: 'Correct Answers',
                  value: '$score',
                  color: Color(0xFFF5F3FF),
                  textColor: Colors.green,
                ),
                _buildStatBox(
                  label: 'Incorrect Answers',
                  value: '${totalQuestions - score}',
                  color: Color(0xFFF5F3FF),
                  textColor: Colors.red,
                ),
              ],
            ),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ProgrammingCourseScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF674AEF),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Back to Course',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build Stat Box Widget
  Widget _buildStatBox({
    required String label,
    required String value,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
