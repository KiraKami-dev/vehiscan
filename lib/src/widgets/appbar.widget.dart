import 'package:flutter/material.dart';
import 'package:vehiscan/src/services/utils.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Utils.appTheme,
      centerTitle: true,
      title: Text('VehiScan',style: TextStyle(color: Utils.textColor),),
      elevation: 0,
    );
  }
}
