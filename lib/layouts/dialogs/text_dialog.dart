import 'package:flutter/material.dart';
import 'package:bsdealz/layouts/items/buttons/dialog_btn.dart';
import 'package:bsdealz/layouts/items/textboxes/CustomTextbox.dart';

class TextDialog extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const TextDialog(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text,
      required this.img})
      : super(key: key);

  @override
  _TextDialogState createState() => _TextDialogState();
}

class _TextDialogState extends State<TextDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 10, top: 70, right: 10, bottom: 10),
          margin: const EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: SizedBox(
            child: ListView(
              children: [
                CustomTextbox(
                    text: widget.title,
                    margin: 5,
                    marginh: 20,
                    controller: TextEditingController(),
                    maxLines: 5,
                    iconData: Icons.info_outline,
                    validator: '',
                    type: cTextBoxType.TEXT),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: DialogBtn(
                          shadowColor: Colors.black,
                          iconColor: Colors.green,
                          color: Colors.green,
                          height: 50,
                          textColor: Colors.white,
                          isCircleIcon: true,
                          padding: 0,
                          iconpadding: 0,
                          margin: 15,
                          radius: 30,
                          fontSize: 14,
                          ovalpadding: 4,
                          text: "OK",
                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.

                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            // Scaffold
                            //     .of(context)
                            //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                          },
                          icon: Icons.info_outline,
                          width: 150,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DialogBtn(
                          shadowColor: Colors.black,
                          iconColor: Colors.red,
                          color: Colors.red,
                          height: 50,
                          textColor: Colors.white,
                          isCircleIcon: true,
                          padding: 0,
                          iconpadding: 0,
                          margin: 15,
                          radius: 30,
                          fontSize: 14,
                          ovalpadding: 0,
                          text: "CANCEL",
                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.

                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            Navigator.pop(context);
                          },
                          icon: Icons.info_outline,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          top: 10,
          child: Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset("assets/images/red_success.png")),
            ),
          ),
        ),
      ],
    );
  }
}
