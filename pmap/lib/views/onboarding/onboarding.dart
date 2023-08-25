import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( // Container로 감싸서 배경색을 설정
      color: Colors.lightGreen, // 원하는 배경색으로 변경
      child: const Center(
        child: Text(
          "온보딩 화면",
          style: TextStyle(
            color: Colors.white, // 글자 색상을 변경하여 보기 좋게 함
          ),
        ),
      ),
    );
  }
}
// 수정해야 함