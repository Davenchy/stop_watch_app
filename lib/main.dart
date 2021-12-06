import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/memory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Memory.initStorage();
  runApp(const MyApp());
}
