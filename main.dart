import 'dart:math';

import 'package:flutter/material.dart';

import 'color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPrimitivenumber = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _counter % 2 == 0
          ? colorr[random.nextInt(colorr.length)]
          : Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Number",
                  helperText:
                      _isPrimitivenumber ? 'Primitive' : 'Not Primitive'),
            ),
            ElevatedButton(
                onPressed: () {
                  final _number = int.tryParse(_controller.text);
                  if (_number != null) {
                    setState(() {
                      if (isPrime(_number)) {
                        _isPrimitivenumber = true;
                      }
                      _isPrimitivenumber = isPrime(_number);
                    });
                  }
                },
                child: Text('Check primitive'))
          ],
        ),
      ),
    );
  }
}

bool isPrime(int number) {
  if (number == 2) {
    return true;
  }
  if (number % 2 == 0) {
    return false;
  }
  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
