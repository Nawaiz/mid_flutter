import 'package:flutter/material.dart'; // Importing Flutter's material design package.

void main() {
  runApp(MyApp()); // Entry point of the app, runs MyApp widget.
}

// Root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp provides basic Material Design layout
      title: 'Pakistan Flag App', // Title of the app
      theme: ThemeData(primarySwatch: Colors.green), // Set app theme color
      home: HomeScreen(), // Set the first screen to be HomeScreen
    );
  }
}

// First Screen with button at center
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Basic layout for a screen
      appBar: AppBar(
        title: Text('Home Screen'), // Top bar title
      ),
      body: Center( // Centers the child widget
        child: ElevatedButton( // A raised button
          child: Text('Show Flag'), // Text on the button
          onPressed: () {
            // Action when button is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FlagScreen()),
            );
          },
        ),
      ),
    );
  }
}

// Second screen showing the Pakistan flag
class FlagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pakistan Flag'), // Top bar title
      ),
      body: Center(
        child: Image.asset('assets/pakistan_flag.png'), // Showing the flag image
      ),
    );
  }
}
