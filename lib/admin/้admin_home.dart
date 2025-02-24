import 'package:car_parking_reservation/admin/admin_parking.dart';
import 'package:car_parking_reservation/admin/admin_setting.dart';
import 'package:car_parking_reservation/admin/admin_users.dart';
import 'package:car_parking_reservation/admin/dashboard.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    AdminDashBoard(), // ✅ เพิ่มหน้าจอ Home เข้ามา
    AdminUserPage(),
    AdminParkingPage(),
    AdminSettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/LogoCARPAKING.png", height: 50),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex], // ✅ โหลดหน้าตาม _selectedIndex
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(3, 23, 76, 1),
        unselectedItemColor: const Color.fromARGB(128, 2, 21, 73),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'Users'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_parking), label: 'Parking'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
