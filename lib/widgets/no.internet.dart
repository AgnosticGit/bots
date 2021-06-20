import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      width: 250.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reconnecting',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(width: 20.0),
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
