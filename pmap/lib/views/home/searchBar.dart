import 'package:flutter/material.dart';
import 'package:pmap/main.dart';

void main() {
  runApp(const MyApp());
}

String searchText = '';

List<String> items = ['음식점', '카페', '공원', '박물관', '미술관'];
List<String> itmContents = [
  '음식점 Contents', 
  '카페 Contents', 
  '공원 Contents', 
  '박물관 Contents',
  '미술관 Contents'];

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        color: Colors.purple.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  // 뒤로가기 버튼 누르면 pop
                  // 샘플 앱에서는 쌓여있는 위젯이 없어 아래와 같이 코드를 넣으면 
                  // 검정색 화면만 나오게 됨
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_ios, size: 18),
                ),
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('강남역[2호선]', textAlign: TextAlign.center)),
                    Icon(Icons.arrow_right_alt),
                    Expanded(child: Text('남산서울타워', textAlign: TextAlign.center)),
                  ],
                ),
                )

            ],
          ),
        ),
      ),
    );
  }
}