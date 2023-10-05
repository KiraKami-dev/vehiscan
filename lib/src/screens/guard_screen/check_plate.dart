import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:vehiscan/src/screens/home_screen.dart';
import 'package:vehiscan/src/utils/global_methods.dart';
import 'package:vehiscan/src/widgets/appbar.widget.dart';

class CheckPlate extends StatefulWidget {
  CheckPlate({
    super.key,
  });

  @override
  State<CheckPlate> createState() => _CheckPlateState();
}

class _CheckPlateState extends State<CheckPlate> {
  bool plateCheck = true;
  final StreamController<String> controller = StreamController<String>();
  void setText(value) {
    controller.add(value);
  }

  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Placeholder(
              child: Container(
                height: 300,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: ScalableOCR(
                    paintboxCustom: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4.0
                      ..color = const Color.fromARGB(153, 102, 160, 241),
                    boxLeftOff: 4,
                    boxBottomOff: 2.7,
                    boxRightOff: 4,
                    boxTopOff: 2.7,
                    boxHeight: MediaQuery.of(context).size.height / 5,
                    getRawData: (value) {
                      inspect(value);
                    },
                    getScannedText: (value) {
                      setText(value);
                    }),
              ),
            ),
            // StreamBuilder<String>(
            //   stream: controller.stream,
            //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //     return Result(
            //         text: snapshot.data != null ? snapshot.data! : "");
            //   },
            // ),
            const Spacer(flex: 3),
            const Text(
              "Vehicle Number",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(flex: 2),
            StreamBuilder<String>(
                stream: controller.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Text(snapshot.data != null ? snapshot.data! : "");
                }), // change from static to dynamic
            const SizedBox(
              height: 20,
            ),
            plateCheck ? const Icon(Icons.check) : const Icon(Icons.cancel),
            // const SizedBox(
            //   width: 40,
            // ),
            const Spacer(flex: 4),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text("Invalid vehicle number tap here!"),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Go Back",
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
