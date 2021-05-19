import 'package:etumedbussiness/posts.dart';
import 'package:etumedbussiness/profile.dart';
import 'package:etumedbussiness/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller = PageController();

  Map<String, IconData> _bottomNavigatorRoutes = {
    'Homepage': Icons.home_mini,
    'Search': Icons.explore,
    'Profile': Icons.account_circle
  };

  int _currentPage = 0;

  void _onSearchClick(var item) {}

  //late SearchTabClickController _searchTabClickController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body => Column(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (idx) => setState(() => _currentPage = idx),
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: PostsPage(),
                ),
                SearchBar(),
                ProfilePage(),
              ],
            ),
          ),
          BottomNavigationBar(
            onTap: (idx) {
              _controller.animateToPage(
                idx,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
              setState(() {});
            },
            currentIndex: _currentPage,
            items: _bottomNavigatorRoutes.keys
                .map<BottomNavigationBarItem>(
                  (key) => BottomNavigationBarItem(
                    icon: Icon(_bottomNavigatorRoutes[key]),
                    label: key,
                  ),
                )
                .toList(),
          )
        ],
      );
}
