import 'package:awesome_icons/awesome_icons.dart';
import 'package:didi/screens/Home/Profile/profile.dart';
import 'package:didi/screens/login/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}
class _homeScreenState extends State<homeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Page1Screen(),
          Page2Screen(),
          Page3Screen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            label: 'Booking Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_3),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userEdit),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Page1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text(
          'This is Page 1',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Center(
        child: Text(
          'This is Page 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class Page3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Center(
        child: Text(
          'This is Page 3',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
