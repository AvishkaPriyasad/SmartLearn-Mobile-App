import 'package:flutter/material.dart';
import 'package:smartlearnapp/screens/course_screen.dart';

class AllCoursesScreen extends StatefulWidget {
  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  final List<String> courses = [
    'Programming',
    'Finance',
    'Photography',
    'History',
    'Design',
    'Marketing'
  ];

  final List<String> courseDescriptions = [
    'Learn programming languages like Python, Java, and more.',
    'Explore financial strategies and investment opportunities.',
    'Master photography techniques and tools.',
    'Dive into historical events and cultures.',
    'Create stunning designs with modern tools.',
    'Learn marketing strategies for growing businesses.',
  ];

  final List<bool> isWished = List.generate(6, (index) => false);

  List<String> filteredCourses = [];
  List<String> filteredDescriptions = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCourses = courses;
    filteredDescriptions = courseDescriptions;
    _searchController.addListener(_filterCourses);
  }

  void _filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourses = courses
          .where((course) => course.toLowerCase().contains(query))
          .toList();

      filteredDescriptions = courseDescriptions
          .where((description) =>
              courses[courseDescriptions.indexOf(description)]
                  .toLowerCase()
                  .contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        foregroundColor: Colors.white,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: Text(
          'All Courses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Courses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // Course List/Grid
          Expanded(
            child: filteredCourses.isNotEmpty
                ? GridView.builder(
                    itemCount: filteredCourses.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F3FF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Wishlist Icon
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  isWished[index]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isWished[index]
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isWished[index] = !isWished[index];
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isWished[index]
                                            ? '${filteredCourses[index]} added to wishlist!'
                                            : '${filteredCourses[index]} removed from wishlist!',
                                      ),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                              ),
                            ),

                            Flexible(
                              child: Image.asset(
                                "images/${filteredCourses[index]}.png",
                                width: 80,
                                height: 80,
                              ),
                            ),
                            SizedBox(height: 5),

                            // Course Title
                            Text(
                              filteredCourses[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),

                            // Course Description
                            Text(
                              'More Info..',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),

                            SizedBox(height: 5),

                            // Explore Button
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF674AEF),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CourseScreen(
                                          filteredCourses[index],
                                          filteredDescriptions[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No courses found!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
