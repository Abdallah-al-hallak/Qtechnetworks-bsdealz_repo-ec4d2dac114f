import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:flutter/material.dart';



class MainBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final int notificationsNumber;
  final String  title;

  const MainBar({
    Key? key,
    required this.height, required this.title, required this.notificationsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          // Container(width: MediaQuery.of(context).size.width,
          // height: height,
          // child: Image.asset("assets/images/header_bg.png",fit: BoxFit.fill,),
          // ),
          Container(
            height: height,
            child: Card(
              child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.transparent,
                padding: EdgeInsets.only(top:5,right: 5,left: 5),
                child: Row(children: [

                  InkWell(
                    child: AppIcon(icon: AppIcon.BACK_ARROW_PATH, size: 24),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Container(alignment: Alignment.center,child:Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),) ,margin: EdgeInsets.only(right: 40),),
                  ),

                ]),
              ),
            ),
          ),
        ],
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}