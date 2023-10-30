import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/backend.dart';
import '../../services/local_storage.dart';
import '../../widgets/appbar.widget.dart';
import '../../widgets/drawer.dart';
import '../admin_record.dart/admin_records.dart';

class UserRegistration extends ConsumerStatefulWidget {
  const UserRegistration({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserRegistrationState();
}

class _UserRegistrationState extends ConsumerState<UserRegistration> {
  final _name = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final buildingsReg =
        ref.watch(registerBuildProvider(_name.text, _password.text, context));
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
                  child: TextField(
                    cursorColor: Colors.black54,
                    textAlign: TextAlign.left,
                    controller: _name,
                    // obscureText: true,
                    decoration: const InputDecoration(
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
                  child: TextField(
                    controller: _password,
                    cursorColor: Colors.black54,
                    textAlign: TextAlign.left,
                    obscureText: true,
                    decoration: const InputDecoration(
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
                      final regBuidling = ref.read(
                          registerBuildProvider(_name.text, _password.text, context));
                      
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
