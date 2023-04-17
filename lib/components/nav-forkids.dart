import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/home/home_page.dart';
import 'package:flutter_quiz/views/profile/profile.dart';
import 'package:flutter_quiz/views/traningCenter/trinningcentr.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Navkid extends StatefulWidget {
  const Navkid({super.key});

  @override
  State<Navkid> createState() => _NavkidState();
}

class _NavkidState extends State<Navkid> {
  int selectedPage = 0;
  final _pageNo = [const ProfileScreen(), const train(), HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNo[selectedPage],
      bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(
              icon: Icon(
                Icons.home,
                color: Colors.orange,
              ),
              title: 'profile',
            ),
            TabItem(
              icon: Icon(Icons.card_travel, color: Colors.orange),
              title: 'home',
            ),
            TabItem(icon: Icon(Icons.add_circle, color: Colors.orange), title: 'test'),
          ],
          initialActiveIndex: selectedPage,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          activeColor: Colors.white,
          backgroundColor: Colors.lime),
    );
  }
}
