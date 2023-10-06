import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';

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
    return Column(
      children: [
        SearchInput(
          textController: searchController,
          hintText: "Search",
          onChanged: filterSearchResults,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: vehicle.length,
            itemBuilder: (context, index) {
              final item = vehicle[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4,
                ),
                child: ListTile(
                  leading: const Icon(Icons.electric_bike_rounded),
                  trailing: const Text("at 8:30 am"),
                  title: Text(item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
