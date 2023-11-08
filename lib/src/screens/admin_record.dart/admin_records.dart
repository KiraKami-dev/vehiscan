import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/edit_screen.dart';
import 'package:vehiscan/src/screens/admin_record.dart/records_screen.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/widgets/add_dialog.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

import '../../services/utils.dart';
import '../../widgets/drawer.dart';

class AdminRecords extends ConsumerStatefulWidget {
  const AdminRecords({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminRecordsState();
}

final recordSwitch = StateProvider.autoDispose<bool>((ref) => true);
final editSwitch = StateProvider.autoDispose<bool>((ref) => false);

class _AdminRecordsState extends ConsumerState<AdminRecords> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    bool isRecord = ref.watch(recordSwitch);
    String buildingName = LocalStorageService.getSelectedBuilding();
    print(isRecord);
    return Scaffold(
        appBar: AppBarWidget(lead: false),
        endDrawer: NavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.apartment_rounded,
                  size: 30,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(Icons.apartment_rounded),
                    Text(
                      buildingName,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        isRecord ? "Records" : "Edit \n Records",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 182,
                child: PageView(
                  onPageChanged: (value) {
                    ref.read(recordSwitch.notifier).update((state) => !state);
                  },
                  controller: pageController,
                  children: [
                    RecordScreen(),
                    EditScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: !isRecord
            ? FloatingActionButton(
                backgroundColor: Colors.black,
                elevation: 2,
                child: Icon(IconlyBold.plus),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddDialog(),
                  );
                  setState(() {
                    // index = (index + 1) % customizations.length;
                  });
                },
              )
            : null);
  }
}
