import 'package:flutter/material.dart';
import 'package:task/screens/registration_page.dart';
import 'package:task/screens/dashboard_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Hassan El Dika'),
            accountEmail: const Text('Hassan.el.dika8@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/Hassan.jpg',
                  height: 90.0,
                  width: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/back.jfif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Registration'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registration(),
                    ),
                  )),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.layers),
              title: const Text('Dashboard'),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardPage(),
                    ),
                  )),
          const Divider(),
        ],
      ),
    );
  }
}
