import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/hive_model.dart';

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    try {
                      List<MyData> dataList = [
                        // MyData('Alice', 25),
                        // MyData('Bob', 30),
                        // MyData('Charlie', 22),
                        MyData('talha', 23),
                      ];

                      if (dataList.isNotEmpty) {
                        final myDataBox = await Hive.openBox('myDataBox');
                        await myDataBox.clear();
                        for (var e in dataList) {
                          myDataBox.add(e);
                        }
                        // Save the list to Hive.
                        await myDataBox.close();
                      }
                    } catch (e) {
                      // ignore: avoid_print
                      print(e);
                    }
                  },
                  child: const Text("press to save data")),
              ElevatedButton(
                  onPressed: () async {
                    final myDataBox = await Hive.openBox('myDataBox');

                    // Retrieve the list from Hive.
                    List<MyData> retrievedDataList =
                        myDataBox.values.cast<MyData>().toList();
                    for (var element in retrievedDataList) {
                      // ignore: avoid_print
                      print(" ${element.age} , ${element.name}");
                    }

                    // Now, `dataList` contains the data you saved in Hive.

                    await myDataBox.close();
                  },
                  child: const Text("press to Load data")),
            ],
          ),
        ),
      ),
    );
  }
}
