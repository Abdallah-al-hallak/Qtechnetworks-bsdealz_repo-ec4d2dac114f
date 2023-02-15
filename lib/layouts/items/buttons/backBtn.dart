import 'package:flutter/material.dart';



class backBtn extends StatelessWidget implements PreferredSizeWidget {


  final Color color;
  const backBtn({
    Key? key,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(5),
        child: IconButton(
          icon:  Icon(Icons.arrow_back ,color:color,size: 28,),
          onPressed: (){
            Navigator.pop(context);
          },),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

}