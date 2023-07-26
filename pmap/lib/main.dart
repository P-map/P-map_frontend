  // ignore_for_file: library_private_types_in_public_api

  import 'package:flutter/material.dart';
  import 'views/onboarding/onboarding.dart';
  import 'views/home/home.dart';
  import 'views/mypage/mypage.dart';
  import 'views/recommendation/recommendation.dart';

  void main() => runApp(const MyApp());

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        home: HomeScreen(),
      );
    }
  }

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    _HomeScreenState createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    int _currentIndex = 0;

    final List<Widget> _children = [
      const Screen0(),
      const Screen1(),
      const Screen2(),
      const Screen3(),

      // 추가하고 싶은 화면들
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("플러터 앱")),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.local_parking), label: "온보딩"),
            BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "주변"),
            BottomNavigationBarItem(icon: Icon(Icons.layers_rounded), label: "추천"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: "MY"),

            // 추가하고 싶은 아이템들
          ],
        ),
      );
    }
  }
