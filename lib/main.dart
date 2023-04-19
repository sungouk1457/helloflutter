import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '메뉴 추천'),
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
  int _counter = 0;
  int leftDice = 0;
  List<String> menuList = ["돈까스","떡볶이","김밥","냉면","짜장면","국밥"];
  String menuName = "국밥";
  void _incrementCounter() {
    setState(() {
      _counter++;
      leftDice = Random().nextInt(menuList.length);
      menuName = menuList[leftDice];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '버튼을 누르면 메뉴 추천',
            ),
            Text(
              menuName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.asset('assets/$menuName.jpeg',width:400 ,height:300, fit:BoxFit.fill)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
