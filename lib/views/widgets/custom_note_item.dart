import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNoteView()));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 24.0,
          left: 16.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffFCCE7F),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Flutter Tips',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Build Your Career with Kasho and much more..',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
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
                'May 21, 2023',
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
