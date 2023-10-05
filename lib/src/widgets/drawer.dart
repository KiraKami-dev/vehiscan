import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_home.dart';
import 'package:vehiscan/src/screens/home_screen.dart';
import 'package:vehiscan/src/services/utils.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.blue,
            // ),
            child: Image.network(
                "https://img.freepik.com/free-vector/front-car-concept-illustration_114360-7978.jpg?w=1380&t=st=1696513992~exp=1696514592~hmac=14f7a429d85bf7aed10af0579c9f9c1690f829aeb184f6615d31cd37868fe825"),
          ),
          ListTile(
            trailing: Icon(IconlyBold.scan),
            title: const Text('Scan'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            trailing: Icon(
              IconlyBold.user2,
              color: Colors.redAccent,
            ),
            title: Text(
              'Login',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdminHome(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
