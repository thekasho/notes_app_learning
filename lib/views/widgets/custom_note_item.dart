import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notter/views/widgets/notes_view_body.dart';
import '../../models/note_model.dart';
import '../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditNoteView()));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 24.0,
          left: 16.0,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                // DateFormat('EEEE, MMM d, yyyy').format( DateTime.parse(note.date) ),
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
