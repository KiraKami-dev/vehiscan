import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen({
    super.key,
  });

  @override
  ConsumerState<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
@override
  Widget build(BuildContext context) {
    ref.watch(recordSwitch.notifier).update((state) => false);
    return Center(
      child: Text('Second Page'),
    );
  }
}
