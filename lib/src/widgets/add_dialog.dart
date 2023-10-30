import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vehiscan/src/services/backend.dart';

class AddDialog extends ConsumerStatefulWidget {
  AddDialog({Key? key}) : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  ConsumerState<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends ConsumerState<AddDialog> {
  TextEditingController vehiNum = TextEditingController();
  bool isCar = false;
  @override
  Widget build(BuildContext context) {
    final edittingController = TextEditingController();
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 2.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
                child: Icon(
                  IconlyBold.addUser,
                  size: 36,
                  color: Colors.white,
                )),

            const SizedBox(
              height: 15,
            ),
            const Text("Vehicle Number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 6,
            ),

            Container(
              width: 160,
              child: TextField(
                controller: vehiNum,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
            // const Text("This will delete the vehicle details",
            //     style: TextStyle(
            //         color: Colors.grey,
            //         fontSize: 12,
            //         fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 28,
            ),
            ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['Car', 'Bike'],
              icons: [Icons.car_crash_rounded, Icons.bike_scooter_rounded],
              activeBgColors: [
                [Colors.deepPurple],
                [Colors.redAccent]
              ],
              onToggle: (index) {
                if (index == 0) {
                  isCar = true;
                } else {
                  isCar = false;
                }
              },
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  invertedColors: true,
                ),
                SimpleBtn1(
                    text: " Add ",
                    onPressed: () {
                      ref.read(addCarsProvider(vehiNum.text.toUpperCase(),isCar));
                      Navigator.of(context).pop();
                      final snackBar = SnackBar(
                        content: const Text('New Vehicle added!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // SnackBar(
                      //   content: Text("New Vehicle added!"),
                      //   backgroundColor: Colors.redAccent,
                      // );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = Colors.black;
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
