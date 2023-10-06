import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';

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
                  trailing: IconButton(
                    icon: Icon(
                      IconlyLight.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DeleteDialog(),
                      );
                    }, //@TODO
                  ),
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
