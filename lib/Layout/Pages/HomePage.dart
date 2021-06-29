import 'package:dsc_world/Layout/Constants.dart';
import 'package:dsc_world/Layout/Screens/Continents.dart';
import 'package:dsc_world/Layout/Screens/Countries.dart';
import 'package:dsc_world/Layout/Screens/FaviorateScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x = 0;
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================================ Body
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('Assets/68a623a96b09d165101ba73eea39e2a7.png'),
          ),
        ),
        child: (x == 0) ? Countinents() : Faviorates(list: list),
      ),
      //================================ BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp), label: "Favorite"),
        ],
        unselectedItemColor: Colors.white,
        selectedItemColor: secondryColor,
        backgroundColor: Colors.black,
        currentIndex: x,
        onTap: (index) async {
          SharedPreferences pref;
          if (index == 1) while (pref == null) pref = await SharedPreferences.getInstance();
          setState(() {
            x = index;
            if (index == 1) list = pref.getStringList("Faviorates");
          });
        },
      ),
    );
  }
}
