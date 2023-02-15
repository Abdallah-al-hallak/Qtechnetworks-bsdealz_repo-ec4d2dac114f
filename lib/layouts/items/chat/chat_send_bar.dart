
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SendBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String message,validator;
  final TextEditingController controller;
 // final List<MessageAPI> chatmessages;
  final ValueChanged<String> addmessage;

  const SendBar({
    Key? key,
    required this.height, required this.message,required this.validator,required this.controller,required this.addmessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
   final TextFormField sendfielid=TextFormField(
      controller:controller,

      validator: (value) {
        if(controller.text.toString()==''||controller.text.toString()==null) {
          return ".";
        }else return null;
      },

      decoration: InputDecoration(
          hintText: "Type your message...",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(2),
          labelStyle: TextStyle(
            color: Colors.grey[600],
          )

      ),
    );
    return
      Container(
          color: Colors.transparent,
          height: height,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 2, right: 2, left: 2),
              child: Row(children: [


              IconButton(
              icon: Icon(CupertinoIcons.plus_circle_fill , color: Colors.grey,
                  size: 35),
              onPressed: () {
                Navigator.pop(context);
              },),
            Expanded(
              child: Container(

                alignment: Alignment.center, child:Form(
                  key: _formKey,child: sendfielid)
            ),
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.arrow_up_circle_fill, color: Colors.redAccent,
              size: 35,),
            onPressed: () {
              print("hghjg");

             // chatmessages.add(MessageInner(controller.text.toString(), 1));
            //  if(sendfielid.controller.text.toString()==''||sendfielid.controller.text.toString()==null) {
                _formKey.currentState!.validate();
            //  }
    if(controller.text.toString()!=''&&controller.text.toString()!=null) {
      addmessage(controller.text.toString());
      controller.text='';
    }else{
      _formKey.currentState!.validate();
    }
            },),

          ]),)
    ,
    )
    ,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}