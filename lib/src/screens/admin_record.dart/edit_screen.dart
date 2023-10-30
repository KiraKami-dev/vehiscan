import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';

import '../../services/backend.dart';
import '../../widgets/delete_dialog.dart';
import '../../widgets/search_input.dart';

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen({
    super.key,
  });

  @override
  ConsumerState<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  final searchController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();
  var vehicle = <String>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ref.watch(recordSwitch.notifier).update((state) => false);
    final getAllCars = ref.watch(carsByIdProvider);
    return getAllCars.when(
        data: (cars) {
          void filterSearchResults(String query) {
            setState(() {
              vehicle = cars
                  .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase())
                          ? true
                          : false)
                  .toList();
            });
          }

          return Column(
            children: [
              SearchInput(
                textController: searchController,
                hintText: "Search",
                onChanged: filterSearchResults,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    final carItem = cars[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4,
                      ),
                      child: ListTile(
                        leading: carItem["iscar"]
                          ? const Icon(Icons.car_crash)
                          : const Icon(Icons.electric_bike_rounded),
                        trailing: IconButton(
                          icon: Icon(
                            IconlyLight.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  DeleteDialog(carId: carItem["id"]),
                            );
                          }, //@TODO
                        ),
                        title: Text(carItem["carnumber"]),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error $stackTrace'));
  }
}
