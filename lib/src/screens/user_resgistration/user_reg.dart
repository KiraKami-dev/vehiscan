import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/local_storage.dart';
import '../../widgets/appbar.widget.dart';
import '../../widgets/drawer.dart';

class UserRegistration extends ConsumerStatefulWidget {
  const UserRegistration({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserRegistrationState();
}

class _UserRegistrationState extends ConsumerState<UserRegistration> {
  static const List<String> _kOptions = <String>[
    'Kishor Kunj 5, virar (w)',
    'Kishor Kunj 4, virar (w)',
    'Kishor Kunj 3, virar (w)',
  ];
  @override
  Widget build(BuildContext context) {
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
                  child: Image.network(
                    "https://img.freepik.com/free-vector/front-car-concept-illustration_114360-7978.jpg?w=1380&t=st=1696513992~exp=1696514592~hmac=14f7a429d85bf7aed10af0579c9f9c1690f829aeb184f6615d31cd37868fe825",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  width: 250,
                  child: const TextField(
                    cursorColor: Colors.black54,
                    textAlign: TextAlign.left,
                    // obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.apartment_rounded),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => AdminRecords(),
                      //   ),
                      // );
                    },
                    icon: const Icon(
                      IconlyLight.login,
                      color: Colors.white70,
                    ),
                    label: const Text("Register"),
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
