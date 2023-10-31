import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/app.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_login.dart';
import 'package:vehiscan/src/screens/guard_screen/check_plate.dart';
import 'package:vehiscan/src/services/backend.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';
import 'package:vehiscan/src/widgets/drawer.dart';

import '../services/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool selectBuild = false;
  List<BuildingModel> buildingCars = [];
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    // final buildingsReg = ref.watch(registerBuildProvider);
    // final buildingLogin = ref.watch(loginBuildProvider);
    final buildings = ref.watch(getAllBuildProvider);
    final getAllCars = ref.watch(carsByIdProvider);
    // final addCar = ref.watch(addCarsProvider);
    // final removeCar = ref.watch(removeCarsProvider);
    final selectedBuilding = LocalStorageService.getSelectedBuilding();
    return Scaffold(
      key: _scaffoldKey,
      appBar: const AppBarWidget(lead: false),
      endDrawer: NavDrawer(),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                  "https://img.freepik.com/free-vector/front-car-concept-illustration_114360-7978.jpg?w=1380&t=st=1696513992~exp=1696514592~hmac=14f7a429d85bf7aed10af0579c9f9c1690f829aeb184f6615d31cd37868fe825"),
            ),
            Container(
              width: 260,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildings.when(
                  data: (builds) {
                    return Autocomplete<BuildingModel>(
                      // displayStringForOption: (option) => option.name,
                      initialValue: TextEditingValue(
                        text: selectedBuilding,
                      ),
                      optionsBuilder:
                          (TextEditingValue textEditingValue) async {
                        if (textEditingValue.text == '') {
                          return <BuildingModel>[];
                        }

                        return builds
                            .where((BuildingModel building) => building.name
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      optionsViewBuilder: (context, onSelected, options) =>
                          Align(
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
                                  onTap: () {
                                    onSelected(item);
                                  },
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
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.apartment_rounded),
                          ),
                        );
                      },
                      onSelected: (buildingName) {
                        setState(
                          () {
                            LocalStorageService.saveBuildingName(
                                buildingName.name);

                            LocalStorageService.saveBuildingId(buildingName.id);
                          },
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Text('Error: $error $stackTrace'),
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Spacer(flex: 1,),
            getAllCars.when(
              data: (cars) {
                // print("This is cars List");
                List<dynamic> carNumbers =
                    cars.map((car) => car['carnumber']).toList();
                
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckPlate(carsNumbers: carNumbers),
                        ),
                      );
                    },
                    icon: Icon(
                      IconlyBold.scan,
                      color: Colors.white70,
                    ),
                    label: const Text("Scan"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.purple,
                      elevation: 1,
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => Text('Error: $error $stackTrace'),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
