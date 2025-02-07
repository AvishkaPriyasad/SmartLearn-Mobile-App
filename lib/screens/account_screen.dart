import 'package:flutter/material.dart';
import 'package:smartlearnapp/screens/home_screen.dart';
import 'package:smartlearnapp/screens/login_screen.dart';

class AccountPage extends StatefulWidget {
  final String username;
  final bool showBackButton;

  AccountPage({this.username = "Guest", this.showBackButton = false});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Track notification state (enabled/disabled)
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        leading: widget.showBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(username: widget.username),
                    ),
                  );
                },
              )
            : null,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        title: Text(
          "Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Section with Pencil Icon on CircleAvatar
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/profile.png"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40, // Width of the circular container
                    height: 40, // Height of the circular container
                    decoration: BoxDecoration(
                      color: Color(0xFF674AEF).withOpacity(0.8), // Background color of the circle
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.drive_file_rename_outline_outlined, color: Colors.white.withOpacity(0.8)),
                      onPressed: () {
                        print("Edit Profile tapped");
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                widget.username,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                "UserID:#a7521b6",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),

            // Settings Section
            Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),

            // Edit Profile with Arrow Icon
            ListTile(
              leading: Icon(Icons.edit, color: Color(0xFF674AEF)),
              title: Text("Edit Profile"),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF674AEF)),
              onTap: () {
                print("Edit Profile tapped");
              },
            ),

            // Change Password with Arrow Icon
            ListTile(
              leading: Icon(Icons.lock, color: Color(0xFF674AEF)),
              title: Text("Change Password"),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF674AEF)),
              onTap: () {
                print("Change Password tapped");
              },
            ),

            // Notifications Switch with reduced size
            ListTile(
              leading: Icon(Icons.notifications, color: Color(0xFF674AEF)),
              title: Text("Notifications"),
              trailing: Transform.scale(
                scale: 0.92,  // Reduce the size of the switch
                child: Switch(
                  value: _notificationsEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: Color(0xFF674AEF),
                ),
              ),
              onTap: () {
                // toggle the switch when tapping on the tile
                setState(() {
                  _notificationsEnabled = !_notificationsEnabled;
                });
              },
            ),

            // Logout Button with White Text and Navigation to WelcomeScreen
            Material(
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white, // Text color set to white
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
