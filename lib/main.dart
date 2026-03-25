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
      title: 'Images Galerie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const MyHomePage(title: 'Galerie Images'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _deg = 0;
  final String _image = 'images/bale.png';

  void _rotateImage() {
    setState(() {
      _deg = _deg + 45;
      if (_deg == 360) _deg = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final angle = _deg * pi / 180;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Images :\n\n\n\n'
            ),
            Transform.rotate(angle: angle, child: Image.asset(_image),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rotateImage,
        tooltip: 'Rotate',
        backgroundColor: Colors.blue,
        child: const Text('Rotate', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}