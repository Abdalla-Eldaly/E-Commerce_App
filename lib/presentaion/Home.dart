import 'package:flutter/material.dart';

import 'home_pages/Home.dart';
import 'home_pages/Profile.dart';
import 'home_pages/Search.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}
int CurrentIndex =0 ;
List<Widget> Pages =[
  Home(),
  SearchPage(),
  ProfilePage(),
] ;
class _HomeState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ],
        currentIndex: CurrentIndex,
        onTap: (val){
          setState(() {
            CurrentIndex=val ;
          });
        },
      ),

    );
  }
}

