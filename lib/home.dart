import 'package:antopolis_project/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cart_page.dart';
import 'favourite_page.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'assets/Home.svg',
                    width: 24,
                    height: 24,
                    color: _selectedIndex == 0 ? Colors.brown : Colors.grey,
                  ),const SizedBox(height: 2,),
                  if (_selectedIndex == 0)
                    Container(
                      width: 14,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: const EdgeInsets.only(top: 2),
                    ),
                ],
              ),

              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(
                    'assets/Heart.png',
                    width: 24,
                    height: 24,
                    color: _selectedIndex == 1 ? Colors.brown : Colors.grey,
                  ),
                  SizedBox(height: 2,),
                  if (_selectedIndex == 1)
                    Container(
                      width: 14,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: const EdgeInsets.only(top: 2),
                    ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(
                    'assets/Bag.png',
                    width: 24,
                    height: 24,
                    color: _selectedIndex == 2 ? Colors.brown : Colors.grey,
                  ),
                  const SizedBox(height: 2,),
                  if (_selectedIndex == 2)
                    Container(
                      width: 14,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: const EdgeInsets.only(top: 2),
                    ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(
                    'assets/Notification.png',
                    width: 24,
                    height: 24,
                    color: _selectedIndex == 3 ? Colors.brown : Colors.grey,
                  ),
                  const SizedBox(height: 2,),
                  if (_selectedIndex == 3)
                    Container(
                      width: 14,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.brown,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: const EdgeInsets.only(top: 2),
                    ),
                ],
              ),
              label: '',
            ),
          ],
        ));
  }
}
