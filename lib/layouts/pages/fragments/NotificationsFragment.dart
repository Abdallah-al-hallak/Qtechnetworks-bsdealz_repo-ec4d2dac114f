
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../items/buttons/BaseButton.dart';
import '../../items/buttons/ToggleBtn.dart';
import '../../items/texts/TitleText.dart';



class NotificationsFragment extends StatefulWidget {

  @override
  _NotificationsFragmentState createState() =>
      _NotificationsFragmentState();
}

class _NotificationsFragmentState extends State<NotificationsFragment> {

  @override
  void initState() {
    super.initState();
    if(mounted) {


      //    fetchCampaigns();

    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return
      Container(

        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,

              child: TitleText(text: "Notifications",onPressed: (){},clickable: false),),
            Wrap(children:  RefreshApp.of(context)!.notificationsWidgets),
          ],
        ),
      );





  }

}

