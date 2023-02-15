import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CloseBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CloseBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Column(
            children: [
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(top:5,right: 5,left: 5),
                    child: Row(children: [

                      Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.xmark,color: Theme
                            .of(context)
                            .primaryColor,),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),

                    ]),
                  ),
                ),
              ),
            ],

          ),
        ],
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}