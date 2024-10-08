import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom Wigets',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Custom Widgets'),
      ),
      body: Center(
        
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NameInputWidget(
              onNameChanged: (newName) {
                setState(() {
                  name = newName;
                });
              },
            ),
            const SizedBox(height: 20),
            Text('Your name is: $name'),
          ],
        ),
      ),
    );
  }
}

// 1. Child Widget: NameInputWidget
class NameInputWidget extends StatefulWidget {
  final Function(String) onNameChanged;

  const NameInputWidget({super.key, required this.onNameChanged});

  @override
  _NameInputWidgetState createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      cursorColor: Colors.blue,
      decoration: const InputDecoration(
        labelText: 'Enter your name',
        border: OutlineInputBorder()
      ),
      onChanged: (text) {
        widget.onNameChanged(text);
      },
    );
  }
}


//day 12 0f 30 days coding challenge

