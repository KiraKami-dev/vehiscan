import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vehiscan/src/screens/home_screen.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

class CheckPlate extends ConsumerStatefulWidget {
  CheckPlate({
    super.key,
  });

  @override
  ConsumerState<CheckPlate> createState() => _CheckPlateState();
}

class _CheckPlateState extends ConsumerState<CheckPlate> {
  final vehicleNumberController = TextEditingController();
  final StreamController<String> controller = StreamController<String>();
  final checkNumber = StateProvider<bool>((ref) => false);

  void setText(value) {
    controller.add(value);
  }

  void dispose() {
    controller.close();
    super.dispose();
  }

  static const List<String> _numberplate = <String>[
    'MH 48 BH 3551',
    'MH 48 CD 2201',
    'MH 48 32 1223',
  ];
  @override
  Widget build(BuildContext context) {
    bool plateCheck = ref.watch(checkNumber);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
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
                    setText(value);
                  }),
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

            StreamBuilder<String>(
                stream: controller.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (_numberplate.contains(snapshot.data)) {
                    // Unhandled Exception: Tried to modify a provider while the widget tree was building.
                    // ref.read(checkNumber.notifier).state = true;
                  } else {
                    // Unhandled Exception: Tried to modify a provider while the widget tree was building.
                    // ref.read(checkNumber.notifier).state = false;
                  }
                  return Text(
                    snapshot.data != null
                        ? "Scanned : ${snapshot.data!}"
                        : "Scanned : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  );
                }), // change from static to dynamic
            const SizedBox(
              height: 20,
            ),
            plateCheck
                ? const Icon(IconlyBold.scan)
                : const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 44,
                  ),
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
              onPressed: (){                  
                ref.read(checkNumber.state).state = true;
              },
              child: const Text("Check Number Manually"),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
