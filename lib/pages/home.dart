import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController note = TextEditingController();
  List<String> notes = []; // Explicitly declare the type as List<String>

  void addNote() {
    setState(() {
      if (note.text.isNotEmpty) {
        notes.add(note.text);
        note.clear();
      }
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 161, 74),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 152, 152, 85),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: note,
            onSubmitted: (_) => addNote(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Type a note...",
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(148, 113, 115, 23),
            ),
            child: ListTile(
              title: Text(notes[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteNote(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
