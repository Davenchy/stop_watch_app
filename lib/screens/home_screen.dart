import 'package:flutter/material.dart';

import '../controllers/stop_watch_controller.dart';
import '../widgets/stop_watch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final StopWatchController controller;

  @override
  void initState() {
    super.initState();
    controller = StopWatchController();
    controller.restore();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.toggle,
      onLongPress: controller.reset,
      onDoubleTap: controller.restore,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Stop Watch',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: StopWatch(
                  controller: controller,
                  specialSecondsColor: Colors.red,
                  secondsHandColor: Colors.red,
                ),
              ),
              const Text(
                'Tap to start/stop\nHold to reset\nDouble tap to restore',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.save,
          backgroundColor: Colors.red,
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
