import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  // List of titles with their corresponding times
  final List<Map<String, String>> videoList = [
    {'title': 'Course Overview', 'time': '5 min 30 sec'},
    {'title': 'Introduction', 'time': '12 min 45 sec'},
    {'title': 'Concepts', 'time': '20 min 15 sec'},
    {'title': 'Principles', 'time': '15 min 50 sec'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                  ? Color(0xFF674AEF)
                  : Color(0xFF674AEF).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.keyboard_double_arrow_right_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            videoList[index]['title']!,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            videoList[index]['time']!,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        );
      },
    );
  }
}
