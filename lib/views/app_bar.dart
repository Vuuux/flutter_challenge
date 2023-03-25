import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Row(
            children: <Widget>[
              Text(
                'Vũ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Spacer(),
              Icon(Icons.menu),
            ],
          ),
        ));
  }
}
