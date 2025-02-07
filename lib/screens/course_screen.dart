import 'package:flutter/material.dart';
import 'package:smartlearnapp/screens/programming_course_screen.dart';
import 'package:smartlearnapp/widgets/description_section.dart';
import 'package:smartlearnapp/widgets/videos_section.dart';

class CourseScreen extends StatefulWidget {
  final String img;
  final String content;

  CourseScreen(this.img, this.content);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isVideosSection = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded, 
            color: Color(0xFF674AEF),
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          widget.img,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Color(0xFF674AEF),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            // Course Image Section
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF5F3FF),
                image: DecorationImage(
                  image: AssetImage("images/${widget.img}.png"),
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFF674AEF),
                    size: 45,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Course Title
            Text(
              "${widget.img} Complete Course",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Created by SmartLearn",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "07 Modules",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProgrammingCourseScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Text(
                        'Enroll',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 1), // Spacing between text and icon
                      Icon(
                        Icons.arrow_right,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 15),

            SizedBox(height: 20),

            // Video and Description Tabs
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: isVideosSection
                        ? Color(0xFF674AEF)
                        : Color(0xFF674AEF).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideosSection = true;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                        child: Text(
                          "Content",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: isVideosSection
                        ? Color(0xFF674AEF).withOpacity(0.6)
                        : Color(0xFF674AEF),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideosSection = false;
                        });
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            isVideosSection ? VideoSection() : DescriptionSection(),
          ],
        ),
      ),
    );
  }
}
