// ignore_for_file: unused_field
import 'package:flutter/material.dart';

import 'package:multi_select_bottom_sheetsx_example/drop_down_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TextEditingController pickItemController;
  List<dynamic> initialList = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print(initialList);
    pickItemController = TextEditingController();
    setState(() {
      initialList = [
        'itme 1',
        'item 2',
        'item 3',
        'item 4',
        'item 5',
        'item 6'
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(5),
          color: const Color.fromARGB(255, 241, 224, 218),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: MultiSelectottomSheet(
                  size: size,
                  title: "Selectionner un nom",
                  width: size.width,
                  enterList: initialList.toList(),
                  radiusContainerValue: 15,
                  surfaceContainerColor: Colors.white,
                  surfaceBottomColor: const Color.fromARGB(255, 241, 224, 218),
                  backgroundColorItem: const Color(0x13936D47),
                  borderColordItem: Colors.brown,
                  primaryBrownColor: const Color.fromARGB(151, 121, 85, 72),
                  selectedItemColor: Colors.brown,
                  unSelectedItemStyle:
                      const TextStyle(color: Color.fromARGB(184, 132, 107, 98)),
                  selectedItemStyle: const TextStyle(color: Colors.brown),
                  titleTextStyle: const TextStyle(color: Colors.black),
                  icon: const Icon(Icons.close),
                  textEditingController: pickItemController,
                  iconShowBottonSheet: const Icon(Icons.search),
                  errorText: "Veuillez Choisir un élément ",
                  isRequired: true,
                  erroTextStyle: const TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(pickItemController.text);
                  }
                },
                child: const Text("Valider"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
