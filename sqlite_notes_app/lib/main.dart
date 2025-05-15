import 'package:flutter/material.dart';
import 'db/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NoteScreen(),
    );
  }
}

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  void _loadNotes() async {
    final notes = await DatabaseHelper().getNotes();
    setState(() {
      _notes = notes;
    });
  }

  void _saveNote() async {
    final text = _controller.text;
    if (text.isEmpty) return;

    await DatabaseHelper().insertNote(text);
    _controller.clear();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Notes')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter note'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save Note'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_notes[index]['text']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
