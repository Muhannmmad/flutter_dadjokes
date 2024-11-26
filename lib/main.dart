import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dad Joke App',
      home: JokeApp(),
    );
  }
}

class JokeApp extends StatefulWidget {
  @override
  _JokeAppState createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {
  String joke =
      "Click to read a new joke if you want to smile or laugh or close the app and stay deppressed as Me 😂 👀 🙈";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dad Joke App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: TextEditingController(text: joke),
              readOnly: true,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Dad Joke',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Get a Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
