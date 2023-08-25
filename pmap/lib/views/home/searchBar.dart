import 'package:flutter/material.dart';
import 'package:pmap/main.dart';

void main() {
  runApp(const MyApp());
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  List<String> items = ['음식점', '카페', '공원', '박물관', '미술관'];
  List<String> itmContents = [
    '음식점 Contents',
    '카페 Contents',
    '공원 Contents',
    '박물관 Contents',
    '미술관 Contents',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // if (searchController.text.isNotEmpty) {
                    //   setState(() {
                    //     searchController.text = ''; // 검색어 초기화
                    //   });
                    // } else {
                    //   Navigator.of(context).pop(); // 뒤로가기
                    // }
                  },
                  icon: searchController.text.isNotEmpty
                      ? const Icon(Icons.clear) // 검색어가 비어있지 않으면 검색어 초기화 아이콘
                      : const Icon(Icons.arrow_back_ios), // 검색어가 비어있으면 뒤로가기 아이콘
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: '검색어를 입력하세요',
                      border: InputBorder.none,
                      // fillColor: Colors.white,
                      // filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      setState(() {
                        searchController.text = ''; // 검색어 초기화
                      });
                    } else {
                      Navigator.of(context).pop(); // 뒤로가기
                    }
                  },
                  icon: searchController.text.isNotEmpty
                      ? const Icon(Icons.clear) // 검색어가 비어있지 않으면 검색어 초기화 아이콘
                      : const Icon(Icons.arrow_back_ios), // 검색어가 비어있으면 뒤로가기 아이콘
                ),
                // const SizedBox(width: 0),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      String selectedQuery = items[0];
                      searchController.text = selectedQuery;
                      print('선택한 검색어: $selectedQuery');
                    },
                    child: Container(
                      width: 82,
                      height: 32,
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(items[0]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String selectedQuery = items[1];
                      searchController.text = selectedQuery;
                      print('선택한 검색어: $selectedQuery');
                    },
                    child: Container(
                      width: 82,
                      height: 32,
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(items[1]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String selectedQuery = items[2];
                      searchController.text = selectedQuery;
                      print('선택한 검색어: $selectedQuery');
                    },
                    child: Container(
                      width: 82,
                      height: 32,
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(items[2]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String selectedQuery = items[3];
                      searchController.text = selectedQuery;
                      print('선택한 검색어: $selectedQuery');
                    },
                    child: Container(
                      width: 82,
                      height: 32,
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(items[3]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String selectedQuery = items[4];
                      searchController.text = selectedQuery;
                      print('선택한 검색어: $selectedQuery');
                    },
                    child: Container(
                      width: 82,
                      height: 32,
                      margin: const EdgeInsets.all(8),
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(items[4]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
