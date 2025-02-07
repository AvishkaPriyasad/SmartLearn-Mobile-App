import 'package:flutter/material.dart';
import 'package:smartlearnapp/screens/quiz_screen.dart';

class ProgrammingCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded, // Changed Icon
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Programming',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
        backgroundColor: Color(0xFF674AEF),
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('images/Programming.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Course Title
            Text(
              'Programming Complete Course',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 10),

            // Course Description
            Text(
              'Learn programming languages like Python, Java, and more. This course covers programming fundamentals, data structures, algorithms, and hands-on projects to build your skills.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),

            // Modules Section
            Text(
              '📖 Course Modules:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 10),

            _buildModule('Module 1: Variables and Data Types', [
              'Variables: Storing and manipulating data',
              'Data types: Integers, floats, strings, booleans',
              'Variable assignment and operations',
              'Type conversion and type casting',
            ], titleColor: Color(0xFF674AEF)),

            // Other Modules...
            _buildModule('Module 2: Operators', [
              'Arithmetic operators (+, -, *, /, %)',
              'Comparison operators (>, <, >=, <=, ==, !=)',
              'Logical operators (and, or, not)',
              'Operator precedence and associativity',
            ], titleColor: Color(0xFF674AEF)),

            _buildModule('Module 3: Control Flow', [
              'Conditional statements: if, else, elif',
              'Loops: for loops, while loops',
              'Break and Continue statements',
              'Nested loops',
            ], titleColor: Color(0xFF674AEF)),

            _buildModule('Module 4: Functions', [
              'Defining functions: Syntax and parameters',
              'Calling functions: Passing arguments',
              'Return values from functions',
              'Function scope and variables',
            ], titleColor: Color(0xFF674AEF)),

            _buildModule('Module 5: Introduction to Data Structures (Optional)', [
              'Lists: Ordered collections of elements',
              'Tuples: Immutable collections',
              'Dictionaries: Key-value pairs',
            ], titleColor: Color(0xFF674AEF)),

            _buildModule('Module 6: Problem Solving and Algorithms', [
              'Breaking down problems into smaller steps',
              'Developing step-by-step solutions',
              'Common algorithms: Searching, sorting (basic level)',
              'Practice with coding challenges and exercises',
            ], titleColor: Color(0xFF674AEF)),

            _buildModule('Module 7: Introduction to Debugging', [
              'Identifying errors: Syntax, runtime,and logic errors',
              'Using debugging tools: Print statements, debuggers',
              'Importance of testing and code reviews',
            ], titleColor: Color(0xFF674AEF)),


            SizedBox(height: 20),

            // Example Code Segment
            Text(
              '💻 Example for Basic Program:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '''# Example Python Program
def greet(name):
    print(f"Hello, {name}!")

greet("World")''',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Knowledge Check Section
            Center(
              child: Column(
                children: [
                  Text(
                    'Check Your Knowledge 👇',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF674AEF),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Attempt Quiz',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Build Module Widget
  Widget _buildModule(String title, List<String> topics, {Color titleColor = Colors.black}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        SizedBox(height: 5),
        ...topics.map((topic) => Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
          child: Text(
            '• $topic',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        )),
        SizedBox(height: 10),
      ],
    );
  }
}
