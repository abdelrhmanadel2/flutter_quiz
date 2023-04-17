import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/views/addKids/kidsList.dart';
import 'package:flutter_quiz/views/profile/profile.dart';
import 'package:flutter_quiz/views/traningCenter/trinningcentr.dart';

class NavParernt extends StatefulWidget {
  const NavParernt({super.key});

  @override
  State<NavParernt> createState() => _NavParerntState();
}

class _NavParerntState extends State<NavParernt> {
  int selectedPage = 0;
  final _pageNo = const [ProfileScreen(), AddChild(), train()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageNo[selectedPage],

      //   CustomScrollView(slivers: [
      //  SliverAppBar(pinned: true,
      //    title: Text('delever me'),
      //   leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
      // actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))],),

      // cate(),
      // food(row:1),
      // food(row:2),
      //],),
//floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,floatingActionButton: FloatingActionButton(onPressed: (){},child:Icon(Icons.home), ),

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
