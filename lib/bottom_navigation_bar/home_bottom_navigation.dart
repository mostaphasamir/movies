import 'package:flutter/material.dart';

import '../movie/presentation/screens/movies_screen.dart';
import '../tvs/presentation/screens/series_screen.dart';

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int currentIndex = 0 ;
  List<dynamic> screens = [
    const MainMoviesScreen(),
    const MainSeriesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        onTap: (value) => setState(() {
          currentIndex = value ;
        }),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined,color: Colors.white,),label: "movies"),
          BottomNavigationBarItem(icon: Icon(Icons.local_movies_outlined,color: Colors.white,),label: "series",),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

