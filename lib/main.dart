import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isChecked = false;
  late TextEditingController _controller;
  var imageSource = "images/question-mark.png";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    hintText: "login",
                    border: OutlineInputBorder(),
                    labelText: "login")),
            TextField(
                controller: _controller,
                obscureText:true,
                decoration: const InputDecoration(
                    hintText: "password",
                    border: OutlineInputBorder(),
                    labelText: "password")),
            ElevatedButton(onPressed: () {
              setState(() {
              // Check if the entered password contains 'QWERTY123'
              if (_controller.text.contains('QWERTY123')) {
              // Update imageSource if password is correct
              imageSource = "images/idea.png";
              } else {
                // Set default image if password is incorrect
                imageSource = "images/stop.png";
              }
            });}, child: const Text('login')),
            Image.asset(imageSource, height: 200, width: 200),
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
