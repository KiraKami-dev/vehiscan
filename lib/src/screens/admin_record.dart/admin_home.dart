import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/local_storage.dart';
import '../../widgets/appbar.widget.dart';
import '../../widgets/drawer.dart';

class AdminHome extends ConsumerStatefulWidget {
  const AdminHome({super.key});

  @override
  ConsumerState<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends ConsumerState<AdminHome> {
  static const List<String> _kOptions = <String>[
    'Kishor Kunj 5, virar (w)',
    'Kishor Kunj 4, virar (w)',
    'Kishor Kunj 3, virar (w)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        endDrawer: NavDrawer(),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                      "https://img.freepik.com/free-vector/front-car-concept-illustration_114360-7978.jpg?w=1380&t=st=1696513992~exp=1696514592~hmac=14f7a429d85bf7aed10af0579c9f9c1690f829aeb184f6615d31cd37868fe825"),
                ),
                Container(
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Autocomplete<String>(
                      initialValue: TextEditingValue(
                          text: LocalStorageService.getSelectedBuilding()),
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return _kOptions.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      optionsViewBuilder: (context, onSelected, options) =>
                          Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            height: 52.0 * options.length,
                            width: 250,
                            child: ListView.builder(
                              itemCount: options.length,
                              padding: EdgeInsets.zero,
                              shrinkWrap: false,
                              itemBuilder: (context, index) {
                                final String item = options.elementAt(index);
                                return InkWell(
                                  onTap: () => onSelected(item),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(item),
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
                      onSelected: (String buildingName) {
                        setState(
                          () {
                            LocalStorageService.saveBuildingName(buildingName);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }
}
