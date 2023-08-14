import 'package:flutter/material.dart';
import 'package:pmap/views/home/scrollWidget.dart';
import 'package:pmap/views/onboarding/onboarding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 300;

  @override
  Widget build(BuildContext context) {
    // height = MediaQuery.of(context).size.height - 200;
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SearchBar(),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: Screen0()),
              ],
            ),
            HomeWidget(),
          ],
        ),
      ),
    );
        
  }
}
