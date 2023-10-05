import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/edit_screen.dart';
import 'package:vehiscan/src/screens/admin_record.dart/records_screen.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

import '../../services/utils.dart';

class AdminRecords extends ConsumerStatefulWidget {
  const AdminRecords({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminRecordsState();
}

final recordSwitch = StateProvider.autoDispose<bool>((ref) => false);
final editSwitch = StateProvider.autoDispose<bool>((ref) => false);

class _AdminRecordsState extends ConsumerState<AdminRecords> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    bool isToken = ref.watch(recordSwitch);
    print(isToken);
    return Scaffold(
      appBar: AppBarWidget(),
      endDrawer: Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),          
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: PageView(
              onPageChanged: (value) {},
              controller: pageController,
              children: [
                RecordsScreen(),
                EditScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
