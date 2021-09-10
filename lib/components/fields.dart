import 'package:flutter/material.dart';

List<IconData> myIcons = [Icons.person, Icons.email, Icons.password];

final formKey = GlobalKey<FormState>();

void enterPressed() {
  print("enter pressed");
}

Widget InputFieldAuth(String hint, int iconIndex, TextEditingController cont) {
  return TextField(
    // key: formKey,
    controller: cont,
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

Widget CommentInputField(String hint, TextEditingController con, fun) {
  return TextField(
    controller: con,
    textInputAction: TextInputAction.go,
    style: TextStyle(height: 1.5, color: Colors.blueGrey.shade600),
    cursorColor: Colors.grey.shade600,
    cursorHeight: 24,
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
      suffixIcon: InkWell(
        onTap: () {
          fun();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.send,
            color: Colors.blueGrey,
          ),
        ),
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
