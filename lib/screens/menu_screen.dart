import 'package:calculator_app/screens/home_screen.dart';
import 'package:calculator_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_rounded)),
              Tab(icon: Icon(Icons.account_circle_rounded)),
            ],
          ),
          title: Text('Calculator App'),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}