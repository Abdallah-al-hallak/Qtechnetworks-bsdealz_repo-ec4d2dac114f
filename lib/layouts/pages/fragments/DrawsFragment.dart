
import 'package:bsdealz/utils/inherited/refresh_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../items/buttons/BaseButton.dart';
import '../../items/buttons/ToggleBtn.dart';



class DrawsFragment extends StatefulWidget {

  @override
  _DrawsFragmentState createState() =>
      _DrawsFragmentState();
}

class _DrawsFragmentState extends State<DrawsFragment> {


  _DrawsFragmentState();
  bool isFrawsFocus=true;
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
    //fetchData();

    print("-------Reloading View draws frag");
    List<Widget> resultWidgets=RefreshApp.of(context)!.upcomigDrawsWidgets;
    Color wtextColr=Colors.grey[500]!;
    Color wbuttonColor=Colors.grey[300]!;
    Color dtextColr=Theme.of(context).primaryColor;
    Color dbuttonColor=Colors.grey[200]!;
    if(!isFrawsFocus){
      resultWidgets=RefreshApp.of(context)!.winnersWidgets;
       dtextColr=Colors.grey[500]!;
       dbuttonColor=Colors.grey[300]!;
       wtextColr=Theme.of(context).primaryColor;
       wbuttonColor=Colors.grey[200]!;
    }
    {
      EasyLoading.dismiss();

        return
        Container(

          child: ListView(
            children: [
             RefreshApp.of(context)!.bannersLayout,
            Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 0,
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  // side: BorderSide(color: Colors.green, width: 0.5),
                    borderRadius: BorderRadius.circular(28)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(child: ToggleButton(
                    isfilled: true,
                    isGradient: false,
                    isActive:false,
                    iconColor:Colors.white,
                    color: dbuttonColor,
                    height:40,
                    text:"Upcoming draws",
                    icon: Icons.home,
                    textColor: dtextColr,
                    padding: 5,
                    iconpadding: 5,
                    margin: 0,
                    radius: 21,
                    fontSize: 14,
                    ovalpadding:4,
                    onPressed: (){
                      setState(() {
                        isFrawsFocus=true;
                      });

                    },
                    width: MediaQuery.of(context).size.width/2-10,
                    startColor: Color(0XffF73F50),
                    endColor:Color(0XffC31322) ,
                  ),),
                    Container(child: ToggleButton(
                      isfilled: true,
                      isGradient: false,
                      isActive:false,
                      iconColor:Colors.white,
                      color: wbuttonColor,
                      height:40,
                      text:"Winners",
                      icon: Icons.home,
                      textColor: wtextColr,
                      padding: 5,
                      iconpadding: 5,
                      margin: 0,
                      radius: 21,
                      fontSize: 14,
                      ovalpadding:4,
                      onPressed: (){
                        setState(() {
                          isFrawsFocus=false;
                        });

                      },
                      width: MediaQuery.of(context).size.width/2-10,
                      startColor: Color(0XffF73F50),
                      endColor:Color(0XffC31322) ,
                    ),
                    )
                ],),
              ),
            ),
              Wrap(children: resultWidgets),
            ],
          ),
        );

    }



  }

}

