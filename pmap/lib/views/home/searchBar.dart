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
  String selectedQuery = '';

  List<String> items = ['음식점', '카페', '공원', '박물관', '미술관'];
  List<String> itmContents = [
    '음식점 Contents',
    '카페 Contents',
    '공원 Contents',
    '박물관 Contents',
    '미술관 Contents',
  ];

  bool isSearchIcon = false;

  void toggleSearchMode() {
    setState(() {
      isSearchIcon = !isSearchIcon;
      if (!isSearchIcon) {
        searchController.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.menu),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: '장소를 검색하세요',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isSearchIcon = value.isNotEmpty;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 32),
                IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      setState(() {
                      searchController.text = '';
                    });
                    }
                  },
                  icon: isSearchIcon && searchController.text.isNotEmpty
                      ? const Icon(Icons.clear)
                      : const Icon(Icons.search),
                  iconSize: 25,
                ),
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
                  categoryWidget(items[0], Icons.restaurant_menu),
                  categoryWidget(items[1], Icons.local_drink),
                  categoryWidget(items[2], Icons.park),
                  categoryWidget(items[3], Icons.castle_outlined),
                  categoryWidget(items[4], Icons.brush)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector categoryWidget(String text, IconData iconData) {
    return GestureDetector(
                  onTap: () {
                    setState(() {
                      searchController.text = text;
                      isSearchIcon = true;
                    });
                  },
                  child: Container(
                      width: 83,
                      height: 33,
                      margin: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            iconData,
                            size: 18,
                            color: const Color(0xff9480F2),
                          ),
                          const SizedBox(width: 5),
                          Text(text),
                        ],
                      ),
                      ),
                );
  }
}
