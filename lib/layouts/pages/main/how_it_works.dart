import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class HowItWorks extends StatefulWidget{
  @override
  _HowItWorksState createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      Scaffold(
          resizeToAvoidBottomInset: false,
          body:SafeArea(
              child:Container(
                child: Column(
                  children: [
                    BackBar(height: 60,notificationsNumber: 0,title: "How it works",),
                    Text("Sed ut perspiciatis unde omnis iste natus "
                        "error sit voluptatem accusantium doloremque "
                        "laudantium, totam rem aperiam, eaque ipsa quae"
                        " ab illo inventore veritatis et quasi architecto"
                        " beatae vitae dicta sunt explicabo. Nemo enim "
                        "ipsam voluptatem quia voluptas sit aspernatur "
                        "aut odit aut fugit, sed quia consequuntur magni"
                        " dolores eos qui ratione voluptatem sequi "
                        "nesciunt. Neque porro quisquam est,"
                        " qui dolorem ipsum quia dolor sit amet,"
                        " consectetur, adipisci velit,"
                        " sed quia non numquam eius modi tempora incidunt ut"
                        " labore et dolore magnam aliquam quaerat voluptatem. "
                        "Ut enim ad minima veniam, quis nostrum exercitationem "
                        "ullam corporis suscipit laboriosam, "
                        "nisi ut aliquid ex ea commodi consequatur?"
                        " Quis autem vel eum iure reprehenderit qui in ea "
                        "voluptate velit esse quam nihil molestiae consequatur,"
                        " vel illum qui dolorem eum fugiat quo voluptas nulla "
                        "pariatur?"),
                  ],
                ),
              )
          )
      );

  }


}