import 'package:flutter/material.dart';
import 'package:smartlearnapp/screens/course_screen.dart';
import 'package:smartlearnapp/screens/login_screen.dart';
import 'package:smartlearnapp/screens/wishlist.dart';
import 'package:smartlearnapp/screens/all_courses_screen.dart';
import 'package:smartlearnapp/screens/account_screen.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({this.username = "Guest"});
  @override
  _HomePageState createState() => _HomePageState();
}

// Static data for categories and images
List<String> catNames = [
  "Category",
  'Classes',
  'Free Course',
  'BookStore',
  'Live Course',
  'LeaderBoard',
];

List<Color> catColors = [
  Color(0xFFFFCF2F),
  Color(0xFF6FE080),
  Color(0xFF61BDFD),
  Color(0xFFFC7F7F),
  Color(0xFFCB84FB),
  Color(0xFF78E667),
];

List<Icon> catIcons = [
  Icon(Icons.category, color: Colors.white, size: 30),
  Icon(Icons.video_library, color: Colors.white, size: 30),
  Icon(Icons.assignment, color: Colors.white, size: 30),
  Icon(Icons.store, color: Colors.white, size: 30),
  Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
  Icon(Icons.emoji_events, color: Colors.white, size: 30),
];

List<String> imgList = [
  'Programming',
  'Finance',
  'Photography',
  'History',
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Header section with search
        Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
          decoration: BoxDecoration(
            color: Color(0xFF674AEF),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 3, bottom: 15),
                child: Text(
                  "Hi, Welcome!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 8,
                    wordSpacing: 8,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here...",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Courses section
        Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Courses",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllCoursesScreen()),
                      );
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ),
                ],
              ),
              // Grid view for course categories
              GridView.builder(
                itemCount: imgList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      String content;
                      switch (imgList[index]) {
                        case 'Programming':
                          content = 'Learn programming languages like Python, Java, and more.';
                          break;
                        case 'Finance':
                          content = 'Explore financial strategies and investment opportunities.';
                          break;
                        case 'Photography':
                          content = 'Master photography techniques and tools.';
                          break;
                        case 'History':
                          content = 'Dive into historical events and cultures.';
                          break;
                        default:
                          content = 'Explore amazing courses.';
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseScreen(imgList[index], content),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFF5F3FF),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/${imgList[index]}.png",
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(height: 1),
                          Text(
                            imgList[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            "More Info..",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      AllCoursesScreen(),
      WishlistPage(username: widget.username, showBackButton: false),
      AccountPage(username: widget.username, showBackButton: false), 
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        actions: [
          Icon(Icons.notifications, color: Colors.white, size: 25),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF674AEF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.username,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,

                    ),
                  ),
                  Text(
                    "UserID:#a7521b6",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Courses'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllCoursesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistPage(showBackButton: true,username: widget.username)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage(username: widget.username, showBackButton: true)), // Navigate to Account Page
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 32,
        selectedItemColor: Color(0xFF674AEF),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 3) { // AccountPage is at index 3
              _pages[3] = AccountPage(username: widget.username); 
            }
            if (index == 2) { // WishlistPage is at index 2
              _pages[2] = WishlistPage(showBackButton: false, username: widget.username);
            }
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
