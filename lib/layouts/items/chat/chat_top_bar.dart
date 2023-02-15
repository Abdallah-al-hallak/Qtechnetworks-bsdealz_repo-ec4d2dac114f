import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ChatTopBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  final String  title;

  const ChatTopBar({
    Key? key,
    required this.height, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius=20;
    return
      Container(
        color: Colors.transparent,
        height: height,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Container(alignment: Alignment.center,
            color: Colors.transparent,
            padding: EdgeInsets.only(top:5,right: 5,left: 5),
            child: Row(children: [
              IconButton(
                icon:  Icon(Icons.arrow_back_ios_rounded ,color:Colors.redAccent),
                onPressed: (){
                  Navigator.pop(context);
                },),
              Expanded(
                child: Container(alignment: Alignment.center,child:Text(title,
                  style: TextStyle(fontSize: 16),) ,margin: EdgeInsets.only(right: 5),),
              ),
              Container(
            margin:EdgeInsets.all(2) ,
          height: 35,
          width: 120,
          child:PhysicalModel(
            elevation: 8.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            shadowColor: Colors.black,
            child:ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child:MaterialButton(
                onPressed:(){
                  launch("tel://214324234");
                },
                color:Colors.red,
                child: Container(
                  padding: EdgeInsets.all(2),

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child:Text("Call Us",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child:Container(

                            child: Icon(CupertinoIcons.phone,size: 16,color: Colors.white,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),),),


          )),


            ]),
          ),
        ),
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}