import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
      content: Row(
        children: [
          const Icon(Icons.close, color: Colors.white, size: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(content),
          ),
        ],
      ),
    ),
  );
}

void snackbarShow(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green,
      content: Row(
        children: [
          const Icon(Icons.done, color: Colors.white, size: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(content),
          ),
        ],
      ),
    ),
  );
}