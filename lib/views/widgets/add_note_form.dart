import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_fiedls.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32.0),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            hint: 'Note Content',
            maxLines: 4,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(height: 50.0),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 300.0),
        ],
      ),
    );
  }
}
