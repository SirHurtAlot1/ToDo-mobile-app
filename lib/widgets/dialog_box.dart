import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCansel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCansel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add your task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: onCansel,
                  child: const Text('Cansel'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
