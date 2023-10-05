import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehiscan/src/screens/admin_record.dart/admin_records.dart';

class RecordsScreen extends ConsumerStatefulWidget {
  const RecordsScreen({
    super.key,
  });

  @override
  ConsumerState<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends ConsumerState<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    // ref.watch(recordSwitch.notifier).update((state) => false);
    return Text('First Page');
  }
}
