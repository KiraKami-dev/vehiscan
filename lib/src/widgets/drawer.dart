import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_login.dart';
import 'package:vehiscan/src/screens/home_screen.dart';
import 'package:vehiscan/src/screens/user_resgistration/user_reg.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/services/utils.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    final buildiingName = LocalStorageService.getSelectedBuilding();
    if (buildiingName.isNotEmpty) {
      setState(() {
        _isLogin = true;
      });
    } else {
      setState(() {
        _isLogin = false;
      });
    }

    return _isLogin? Drawer(
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
          Text(
            _isLogin ? buildiingName : "Building",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
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
              color: Colors.black,
            ),
            title: Text(
              'Records',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdminLogin(),
                ),
              );
            },
          ),
          ListTile(
            trailing: Icon(
              IconlyBold.logout,
              color: Colors.redAccent,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              LocalStorageService.clear();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    ) :Drawer(
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
          Text(
            _isLogin ? buildiingName : "VehiScan",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
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
              color: Colors.black,
            ),
            title: Text(
              'Register',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserRegistration(),
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
                  builder: (context) => AdminLogin(),
                ),
              );
            },
          ),          
        ],
      ),
    ) ;
  }
}
