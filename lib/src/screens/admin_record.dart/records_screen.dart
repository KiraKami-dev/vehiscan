import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/models/building_model.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';
import 'package:vehiscan/src/services/local_storage.dart';

import '../../services/backend.dart';
import '../../widgets/search_input.dart';

class RecordScreen extends ConsumerStatefulWidget {
  const RecordScreen({
    super.key,
  });

  @override
  ConsumerState<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends ConsumerState<RecordScreen> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  final searchController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();
  var vehicle = <String>[];

  @override
  void initState() {
    vehicle = items;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      vehicle = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ref.watch(recordSwitch.notifier).update((state) => false);
    final getAllCars = ref.watch(carsByIdProvider);
    return Column(
      children: [
        SearchInput(
          textController: searchController,
          hintText: "Search",
          onChanged: filterSearchResults,
        ),
        Expanded(
          child: getAllCars.when(
            data: (cars) => ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                final carItem = cars[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: carItem["iscar"] ? Icon(Icons.car_crash)
                    : Icon(Icons.electric_bike_rounded),
                    trailing: const Text("at 8:30 am"),
                    title: Text(carItem["carnumber"]),
                  ),
                );
              },
            ),
            error: (error, stackTrace) => Text('Error: $error $stackTrace'),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
