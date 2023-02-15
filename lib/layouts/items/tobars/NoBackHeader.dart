import 'package:flutter/material.dart';
import 'package:bsdealz/network/HttpAPI.dart';



class NoBackHeader extends StatefulWidget implements PreferredSizeWidget {
  final double height;
 final String title;

  const NoBackHeader({Key? key, required this.height, required this.title})
      : super(key: key);

  @override
  _NoBackHeaderState createState() => _NoBackHeaderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}

class _NoBackHeaderState extends State<NoBackHeader> {

  _NoBackHeaderState();
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomHeaderItem(
        height: widget.height,title: widget.title,
    );
  }
}

// Define a custom Form widget.
class CustomHeaderItem extends StatefulWidget {
  final double height;
 final String title;

  const CustomHeaderItem({Key ?key, required this.height,required this.title})
      : super(key: key);

  @override
  CustomHeaderItemState createState() {
    return CustomHeaderItemState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CustomHeaderItemState extends State<CustomHeaderItem> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomBannerForm1State>.
  final _formKey = GlobalKey<FormState>();
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double radius = 7;
    // Build a Form widget using the _formKey created above.

    return Container(
      margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 7),
      height: widget.height,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(padding:EdgeInsets.all(0),
      child: Text(widget.title,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),)),
              
            ],
          ),

        ],
      ),
    );
  }

}
