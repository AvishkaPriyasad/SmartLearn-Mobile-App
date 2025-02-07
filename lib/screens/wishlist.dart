import 'package:flutter/material.dart';
import 'package:smartlearnapp/screens/home_screen.dart';

class WishlistPage extends StatefulWidget {
  final bool showBackButton;
  final String username;
  WishlistPage({this.showBackButton = false, required this.username});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // List of courses on the wishlist
  List<Map<String, String>> wishlistCourses = [
    {'title': 'Programming', 'image': 'images/Programming.png', 'price': 'Explore'},
    {'title': 'Finance', 'image': 'images/Finance.png', 'price': 'Explore'},
    {'title': 'Photography', 'image': 'images/Photography.png', 'price': 'Explore'},
  ];

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
                        builder: (context) => HomePage(username: widget.username)),
                  );
                },
              )
            : null,

        iconTheme: IconThemeData(color: Colors.white, size: 25),
        title: Text(
          "Wishlist",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: wishlistCourses.length,
        itemBuilder: (context, index) {
          return WishlistItem(
            title: wishlistCourses[index]['title']!,
            image: wishlistCourses[index]['image']!,
            price: wishlistCourses[index]['price']!,
            onDelete: () {
              // Remove course from the wishlist
              setState(() {
                wishlistCourses.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${wishlistCourses[index]['title']} removed from Wishlist."),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final VoidCallback onDelete;

  const WishlistItem({
    required this.title,
    required this.image,
    required this.price,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
