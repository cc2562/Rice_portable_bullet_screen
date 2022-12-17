import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
//颜色选择
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sleek_button/sleek_button.dart';
import 'show.dart';

class aboutpage extends StatefulWidget {
  const aboutpage({Key? key}) : super(key: key);

  @override
  State<aboutpage> createState() => _aboutpageState();

}




class _aboutpageState extends State<aboutpage> {
  final Uri _url = Uri.parse('https://www.ccrice.com');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            appBar: AppBar(title: Text("关于与设置"),),
            body: Container(
              decoration: BoxDecoration(
                  //color: Colors.white
              ),
              child: Padding(padding: EdgeInsetsDirectional.all(2.w),
                child: ListView(
                  children: [
                    SmallUserCard(cardColor: Colors.green, userName: "米饭随身弹幕", userProfilePic: NetworkImage("https://cute.applover.cn/2022/11/11/636e474cad504.jpg"), onTap: null,userMoreInfo: Text("打Call聚会神器",style: TextStyle(color: Colors.white),),),
                    SettingsGroup(
                      items: [
                        SettingsItem(icons: CupertinoIcons.star_fill, title: "软件作者",onTap: (){
                          _launchUrl();
                        },subtitle: "CC米饭",iconStyle: IconStyle(backgroundColor: Colors.amberAccent),)
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
