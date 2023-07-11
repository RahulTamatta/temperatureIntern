import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<double> valueNotifier;
  bool toggleValue = true;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(0.0);
  }

  void toggleButton(bool value) {
    setState(() {
      toggleValue = value;
    });
  }

  void decreaseCounter() {
    if (toggleValue) {
      setState(() {
        valueNotifier.value -= 1.0;
      });
    }
  }

  void increaseCounter() {
    if (toggleValue) {
      setState(() {
        valueNotifier.value += 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.person,
            color: Colors.grey,
            size: 40,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  "Living Room",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 60),
              SimpleCircularProgressBar(
                size: 200,
                valueNotifier: valueNotifier,
                progressStrokeWidth: 8,
                backStrokeWidth: 15,
                mergeMode: true,
                onGetText: (value) {
                  return Text(
                    '${value.toInt()}\u{00B0}C',
                    style: const TextStyle(fontSize: 40),
                  );
                },
                progressColors: const [
                  Color.fromRGBO(105, 68, 210, 1.0),
                  Colors.purple
                ],
                backColor: Colors.black.withOpacity(0.4),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decreaseCounter,
                      disabledColor: Colors.grey,
                      color: toggleValue ? null : Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: increaseCounter,
                      disabledColor: Colors.grey,
                      color: toggleValue ? null : Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Switch(
                value: toggleValue,
                onChanged: toggleButton,
                activeColor: Colors.white,
                activeTrackColor: Colors.grey,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
