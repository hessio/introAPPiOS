import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('images/Free_Sample_By_Wix.jpg'),
            width: 102.0,
            height: 102.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Intro',
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}
