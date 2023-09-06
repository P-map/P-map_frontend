import 'package:flutter/material.dart';
import 'hidenavbar.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});
  
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

  class _HomeWidgetState extends State<HomeWidget> {
    late double _height;

    final double _lowLimit = 120;
    final double _highLimit = 670;
    final double _upThresh = 150;
    final double _boundary = 200;
    final double _downThresh = 250;

    final HideNavbar hiding = HideNavbar();

    bool _longAnimation = false;

  @override
  void initState() {
    super.initState();
    _height = _lowLimit;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -10,
      child: GestureDetector(
        onVerticalDragUpdate: ((details) {
          double? delta = details.primaryDelta;
          if (delta != null) {
            if(_longAnimation || 
            (_height <= _lowLimit && delta > 0) || 
            (_height >= _highLimit && delta < 0)) {
              return;
            }
            setState(() {
              if (_upThresh <= _height && _height <= _boundary) {
                _height = _highLimit;
                _longAnimation = true;
              }
              else if (_boundary <= _height && _height <= _downThresh) {
                _height = _lowLimit;
                _longAnimation = true;
              }
              else {
                _height -= delta;
              }
            });
          }
        }),
        
      child: AnimatedContainer(
        curve: Curves.bounceOut,
        onEnd: () {
          if (_longAnimation) {
            setState(() {
              _longAnimation = false;
            });
          }
        },
        duration: const Duration(milliseconds: 100),
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, -4), blurRadius: 10, spreadRadius: 0)],
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        width: MediaQuery.of(context).size.width,
        height: _height,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container( // 위젯 안의 선
              width: 50,
              height: 4.5,
              decoration: const BoxDecoration(
                color: Color(0xff614cbb),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
          ],
        ),
        )

    ),);
  }

}