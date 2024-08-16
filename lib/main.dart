import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Wigets',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        title: Text('Custom Widgets'),
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
            SizedBox(height: 20),
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

  NameInputWidget({required this.onNameChanged});

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
      decoration: InputDecoration(
        labelText: 'Enter your name',
      ),
      onChanged: (text) {
        widget.onNameChanged(text);
      },
    );
  }
}

// 2. Stateful Widget: MyHomePage
// This is a stateful widget because the name can change and the UI needs to update accordingly.

// 3. Widget within a Widget: The NameInputWidget is a child of the MyHomePage widget.
// The Text widget that displays the name is also a child of MyHomePage.

// 4. Child-Parent Relationship:
// The NameInputWidget is a child widget of MyHomePage.
// When the user enters a name in NameInputWidget, it calls the onNameChanged function in MyHomePage.
// MyHomePage then updates its state (the name variable) and rebuilds the UI to display the new name.
