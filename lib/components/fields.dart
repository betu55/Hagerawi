import 'package:flutter/material.dart';

List<IconData> myIcons = [Icons.person, Icons.email, Icons.password];
final formKey = GlobalKey<FormState>();
Widget InputFieldAuth(String hint, int iconIndex) {
  return TextField(
    // key: formKey,
    style: TextStyle(height: 1.5),
    cursorColor: Colors.grey.shade600,
    cursorHeight: 24,
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      prefixIcon: Icon(
        myIcons[iconIndex],
        color: Colors.blueGrey,
      ),
      hintStyle: TextStyle(
        color: Colors.blueGrey,
        fontStyle: FontStyle.italic,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 12,
      ),
      focusColor: Colors.red,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      hintText: hint,
      fillColor: Colors.grey.shade200.withAlpha(120),
      filled: true,
    ),
  );
}

Widget InputField(String hint, TextEditingController con) {
  return TextField(
    controller: con,
    style: TextStyle(height: 1.5),
    cursorColor: Colors.grey.shade600,
    cursorHeight: 24,
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      hintStyle: TextStyle(
        color: Colors.blueGrey,
        fontStyle: FontStyle.italic,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 12,
      ),
      focusColor: Colors.red,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
      hintText: hint,
      fillColor: Colors.grey.shade200.withAlpha(120),
      filled: true,
    ),
  );
}
