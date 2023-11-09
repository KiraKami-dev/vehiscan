import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vehiscan/src/screens/home_screen.dart';
import 'package:vehiscan/src/services/backend.dart';
import 'package:vehiscan/src/services/local_storage.dart';
import 'package:vehiscan/src/services/utils.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

import '../../models/building_model.dart';

class CheckPlate extends ConsumerStatefulWidget {
  CheckPlate({super.key});

  @override
  ConsumerState<CheckPlate> createState() => _CheckPlateState();
}

class _CheckPlateState extends ConsumerState<CheckPlate> {
  final vehicleNumberController = TextEditingController();
  // final StreamController<String> controller = StreamController<String>();
  final checkNumber = StateProvider<bool>((ref) => false);
  bool plateCheckTest = false;
  bool manualCheck = false;

  String carCheck = "";
  // final testList = ["MH40JU2021"];
  void setText(String value, List<dynamic> carNumbers) {
    
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        carCheck = value;
      });
    });
    if (carNumbers.any((ele) {
      return ele == value.trim();
    })) {
      print("Verified");
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          plateCheckTest = true;
        });
        Timer(Duration(seconds: 5), () {
          setState(() {
            plateCheckTest = false;
          });
        });
      });
    } else {
      print("Not Checked");
      plateCheckTest = false;
    }
  }

  void dispose() {
    super.dispose();
    // controller.close();
  }

  @override
  Widget build(BuildContext context) {
    final getAllCars = ref.watch(carsByIdProvider);
    bool plateCheck = ref.watch(checkNumber);
    final buildingName = LocalStorageService.getSelectedBuilding();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(lead: true),
      body: getAllCars.when(
        data: (cars) {
          List<dynamic> carNumbers =
              cars.map((car) => car['carnumber']).toList();

          if (carNumbers.contains(carCheck)) {
            ref.read(checkNumber.notifier).state = true;
            showSnackBar(context, "Vehicle detected!");
            Timer(const Duration(seconds: 5), () {
              ref.read(checkNumber.notifier).state = false;
            });
          } else {
            ref.read(checkNumber.notifier).state = false;
          }

          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                Center(child: Text(buildingName)),
                Container(
                  // height: 400,
                  // width: 350,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  //   border: Border.all(
                  //     width: 0,
                  //   ),
                  // ),
                  child: ScalableOCR(
                    paintboxCustom: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6.0
                      ..color = Color.fromARGB(153, 66, 75, 228),
                    boxLeftOff: 2,
                    boxBottomOff: 2.5,
                    boxRightOff: 5,
                    boxTopOff: 2.5,
                    boxHeight: 300,
                    getRawData: (value) {
                      inspect(value);
                    },
                    getScannedText: (value) {
                      if (!plateCheckTest) {
                        setText(value, carNumbers);
                      }
                    },
                  ),
                ),
                Text(
                  "Or enter the ‘Vehicle Number” below.",
                  textAlign: TextAlign.center,
                ),
                const Spacer(
                  flex: 1,
                ),
                // Note: Same code is applied for the TextFormField as well
                Container(
                  height: 30,
                  width: 160,
                  child: TextField(
                    cursorColor: Colors.black54,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.go,
                    onChanged: (value) {
                      vehicleNumberController.value = TextEditingValue(
                          text: value.toUpperCase(),
                          selection: vehicleNumberController.selection);
                    },
                    textCapitalization: TextCapitalization.characters,
                    controller: vehicleNumberController,
                    decoration: InputDecoration(
                      // border: Border(bottom: 1),s
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5, color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 0.5, color: Colors.black), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                // const Text(
                //   "Vehicle Number",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                const Spacer(flex: 1),

                // StreamBuilder(
                //     stream: controller.stream,
                //     builder:
                //         (BuildContext context, AsyncSnapshot<String> snapshot) {
                //       String scannedNumber = snapshot.data ?? "";
                //       String vehicleNumber = scannedNumber.replaceAll(
                //           RegExp(r'[^a-zA-Z0-9 ]'), '');
                //       if (carNumbers.contains(vehicleNumber)) {
                //         ref.read(checkNumber.notifier).state = true;
                //         showSnackBar(context, "Vehicle detected!");
                //         Timer(const Duration(seconds: 5), () {
                //           ref.read(checkNumber.notifier).state = false;
                //         });
                //       } else {
                //         ref.read(checkNumber.notifier).state = false;
                //       }

                //       return Text(
                //         snapshot.data != null
                //             ? "Scanned : $vehicleNumber"
                //             : "Scanned : ",
                //         textAlign: TextAlign.center,
                //         style: const TextStyle(fontSize: 14),
                //       );
                //     }),
                //
                Text("Scanned : $carCheck"),
                const SizedBox(
                  height: 20,
                ),
                manualCheck || plateCheckTest
                    ? Image.asset("assets/green-checkmark-line-icon.png",
                        height: 40)
                    : Image.asset("assets/red-x-line-icon.png", height: 40),
                // const SizedBox(
                //   width: 40,
                // ),
                const Spacer(flex: 1),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (carNumbers.contains(vehicleNumberController.text)) {
                      // ref.read(checkNumber.notifier).update((state) => true);
                      setState(() {
                        manualCheck = true;
                        showSnackBar(context, "Vehicle detected!");
                        Timer(const Duration(seconds: 5), () {
                          // ref.read(checkNumber.notifier).state = false;
                          manualCheck = false;
                        });
                      });
                    } else {
                      setState(() {
                        manualCheck = false;
                      });
                      // ref.read(checkNumber.notifier).update((state) => false);
                      showSnackBar(context, "Intruder!!");
                    }
                    // print("This is plate check : $plateCheck");
                    // print(plateCheck);
                  },
                  child: const Text("Check Number Manually"),
                ),
                const Spacer(flex: 2),
              ],
            ),
          );
        },
        error: (error, stackTrace) =>
            Center(child: Text('Error: $error $stackTrace')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
