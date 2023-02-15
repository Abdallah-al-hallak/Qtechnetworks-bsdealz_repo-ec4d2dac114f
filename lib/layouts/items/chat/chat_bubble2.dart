import 'package:flutter/material.dart';

class ChatBubble2 extends StatelessWidget {

  final String message;
  const ChatBubble2({
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius=25;
    double padding=20;
    double margin=20;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(

        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          ),
        ),
        child: Text(message),
      ),
    );
  }


}
