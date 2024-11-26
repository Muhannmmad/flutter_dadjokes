import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  Future<void> fetchJoke() async {
    final url = Uri.parse('https://icanhazdadjoke.com/');
    final response = await http.get(
      url,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        joke = data['joke'];
      });
    } else {
      setState(() {
        joke = "looks like something wrong . Try again ";
      });
    }
  }

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
              onPressed: fetchJoke,
              child: Text('Get a Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
