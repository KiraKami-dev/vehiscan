import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';

import '../../services/backend.dart';
import '../../services/local_storage.dart';
import '../../widgets/appbar.widget.dart';
import '../../widgets/drawer.dart';

class AdminLogin extends ConsumerStatefulWidget {
  const AdminLogin({super.key});

  @override
  ConsumerState<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends ConsumerState<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    final buildings = ref.watch(getAllBuildProvider);
    return Scaffold(
        appBar: const AppBarWidget(lead: false),
        endDrawer: NavDrawer(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/Logo.jpg")
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 260,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildings.when(
                        data: (builds) {
                          return Autocomplete<BuildingModel>(
                            initialValue: TextEditingValue(
                                text:
                                    LocalStorageService.getSelectedBuilding()),
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return <BuildingModel>[];
                              }
                              return builds
                                  .where((BuildingModel building) =>
                                      building.name.toLowerCase().contains(
                                          textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            optionsViewBuilder:
                                (context, onSelected, options) => Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Container(
                                  height: 52.0,
                                  width: 250,
                                  child: ListView.builder(
                                    itemCount: options.length,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: false,
                                    itemBuilder: (context, index) {
                                      final item = options.elementAt(index);
                                      return InkWell(
                                        onTap: () => onSelected(item),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Text(item.name),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            fieldViewBuilder: (context, textEditingController,
                                focusNode, onFieldSubmitted) {
                              return TextField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.apartment_rounded),
                                ),
                              );
                            },
                            onSelected: (buildingName) {
                              setState(
                                () {
                                  LocalStorageService.saveBuildingName(
                                      buildingName.name);
                                  LocalStorageService.saveBuildingId(
                                      buildingName.id);
                                },
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) =>
                            Text('Error: $error $stackTrace'),
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 250,
                  child: const TextField(
                    cursorColor: Colors.black54,
                    textAlign: TextAlign.left,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(IconlyLight.password),
                      // iconColor: Colors.black,
                      // focusColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.black45),
                      ),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AdminRecords(),
                        ),
                      );
                    },
                    icon: const Icon(
                      IconlyLight.login,
                      color: Colors.white70,
                    ),
                    label: const Text("Login"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.purple,
                      elevation: 1,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ]),
        ));
  }
}
