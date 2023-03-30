import 'dart:math';

import 'package:flutter/material.dart';

import '../../../network/models/APILevel.dart';
import '../../../utils/Config.dart';
import '../../../utils/GetSettingByKey.dart';

import '../texts/BaseText.dart';

class MembershipItem extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final double width;
  final ApiLevel level;

  MembershipItem({
    Key? key,
    required this.height,
    required this.width,
    required this.level,
  }) : super(key: key);
  @override
  _MembershipItemState createState() => _MembershipItemState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _MembershipItemState extends State<MembershipItem> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {},
        child: MembershipItemSingle(
          height: widget.height,
          width: widget.width,
          text: "555",
          level: widget.level,
        ));
  }
}

// Define a custom Form widget.
class MembershipItemSingle extends StatefulWidget {
  final double height, width;
  final String text;
  final ApiLevel level;
  const MembershipItemSingle(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.level})
      : super(key: key);
  @override
  MembershipItemSingleState createState() {
    return MembershipItemSingleState();
  }
}

class MembershipItemSingleState extends State<MembershipItemSingle> {
  final _formKey = GlobalKey<FormState>();
  ShapeBorder shapeBorder1 = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(width: 1, color: Color(0XFF707070)));
  List<Color> gradiant = [Color(0XFFFFFFFF), Color(0XFFFFFFFF)];
  List<Color> sidegradiant = [Color(0XFFFFFFFF), Color(0XFFFFFFFF)];

  @override
  Widget build(BuildContext context) {
    try {
      gradiant = [
        Color(int.parse(widget.level.startColor.toString())),
        Color(int.parse(widget.level.endColor.toString()))
      ];
      sidegradiant = [
        Color(int.parse(widget.level.sideColorStart.toString())),
        Color(int.parse(widget.level.sideColorEnd.toString()))
      ];
    } catch (error) {
      print(error);
    }

    String levelhint = "${AppSettingTheme.getTheme(
      context,
      Config.EARN_KEY,
      Config.EARN_VALUE,
    )} ${AppSettingTheme.getTheme(
      context,
      Config.FROM_KEY,
      Config.FROM_VALUE,
    )} ${widget.level.startThreshold!.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '')}-${widget.level.endThreshold!.replaceAll(RegExp(r'([.]*0+)(?!.*\d)'), '')} to reach this level";

    Widget levelNameWidget = Transform(
      transform: Matrix4.skewY(0.0)..rotateZ(-pi / 2.0),
      child: Container(
        margin: EdgeInsets.only(right: 00),
        child: Transform.translate(
          offset: Offset(-165, -50),
          child: Container(
            height: 165,
            width: 165,
            alignment: Alignment.center,
            child: BaseText(
              color: Color(int.parse(widget.level.sideFontColor.toString())),
              text: "${widget.level.name}",
              margin: 5,
              marginh: 0,
              fontSize: 20,
              onPressed: () {},
              fontWeight: FontWeight.bold,
              clickable: false,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
    return SizedBox(
      height: widget.height,
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 1, top: 8),
        alignment: Alignment.center,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.green, width: 0.5),
              //   F7F7F7
              //   E8E7E7
              borderRadius: BorderRadius.circular(
            22,
          )),
          child: Stack(
            children: [
              Container(
                  alignment: Alignment.centerLeft, child: levelNameWidget),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: sidegradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22.0),
                              bottomLeft: Radius.circular(22))),
                      child: Container(
                        width: 50,
                        height: widget.height,
                      ),
                    ),
                    Expanded(
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(22),
                              bottomRight: Radius.circular(22)),
                        ),
                        child: Container(
                          //    width: MediaQuery.of(context).size.width,

                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    width: 200,
                                    height: 70,
                                    child: Card(
                                      elevation: 0,
                                      color: Color(int.parse(widget
                                          .level.centerBoxColor
                                          .toString())),
                                      shape: shapeBorder1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          BaseText(
                                            color: Color(int.parse(widget
                                                .level.contentFontColor
                                                .toString())),
                                            text: "${widget.level.name}",
                                            margin: 10,
                                            marginh: 25,
                                            fontSize: 21,
                                            onPressed: () {},
                                            fontWeight: FontWeight.bold,
                                            clickable: false,
                                          ),
                                          // BaseText(
                                          //   color: Colors.grey,
                                          //   text:"",
                                          //   margin: 5,
                                          //   marginh: 25,
                                          //   fontSize: 12,
                                          //   onPressed: (){},
                                          //   fontWeight: FontWeight.normal, clickable: false,
                                          // ),
                                          Container(
                                            height: 5,
                                            width: 1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        child: BaseText(
                                          color: Color(int.parse(widget
                                              .level.contentFontColor
                                              .toString())),
                                          text: "${widget.level.benefits}",
                                          margin: 5,
                                          marginh: 25,
                                          fontSize: 9,
                                          onPressed: () {},
                                          fontWeight: FontWeight.bold,
                                          clickable: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      BaseText(
                                        color: Color(int.parse(widget
                                            .level.contentFontColor
                                            .toString())),
                                        text: levelhint,
                                        margin: 5,
                                        marginh: 25,
                                        fontSize: 9,
                                        onPressed: () {},
                                        fontWeight: FontWeight.normal,
                                        clickable: false,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
