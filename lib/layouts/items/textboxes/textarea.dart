import 'package:flutter/material.dart';


class CustomTextarea extends StatefulWidget {

  final String text,validator,msg;
  final double margin,marginh;
  final int maxLines;
  final TextEditingController controller;
  const CustomTextarea({
    Key? key,
    required this.text,
    required this.msg,
    required this.margin,
    required this.marginh,
    required this.validator,
    required this.controller,

    required this.maxLines,
  }) : super(key: key);

  @override
  _CustomTextareaState createState() => _CustomTextareaState();
}

class _CustomTextareaState extends State<CustomTextarea> {

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      color: Colors.white70,
        margin:EdgeInsets.only(top:widget.margin,right: widget.marginh,left: widget.marginh),
        child:TextFormField(
          maxLines: widget.maxLines,
          controller:widget.controller,
          validator: (value) {
            if(widget.validator=='') {
              return true
                  ? null
                  : widget.msg;
            }else{
              return widget.validator;
            }
          },
          decoration: InputDecoration(
              hintText: widget.msg,
              contentPadding: EdgeInsets.all(2),
              labelText: widget.text,
              labelStyle:  TextStyle(
                color: Colors.grey,
              )

          ),
        ));

  }
}