import 'package:flutter/material.dart';
import 'package:vehiscan/src/services/utils.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Utils.appTheme,
      // centerTitle: true,
      title: Text('VehiScan',style: TextStyle(color: Utils.textColor,fontSize: 20),textAlign: TextAlign.left,),
      elevation: 0,
    );
  }
}
