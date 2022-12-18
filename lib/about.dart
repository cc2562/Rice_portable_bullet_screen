import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';import 'procy.dart';
import 'fuwu.dart';
import '/fun/cunchu.dart';
//颜色选择
import 'package:sleek_button/sleek_button.dart';
import 'show.dart';

class aboutpage extends StatefulWidget {
  const aboutpage({Key? key}) : super(key: key);

  @override
  State<aboutpage> createState() => _aboutpageState();

}




class _aboutpageState extends State<aboutpage> {
  var ipadmod = false;

  void initState() {
    super.initState();
    //界面build完成后执行回调函数
    setIpadmod();
  }

  void setIpadmod() async {
    bool? getipadmod = await isipadmod();
    setState(() {
      ipadmod = getipadmod!;
    });
  }

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
                     SettingsGroup(
                      items: [
                        SettingsItem(icons: CupertinoIcons.device_phone_landscape, title: "平板模式",
                        onTap: (){},
                          iconStyle: IconStyle(
                            withBackground: true,
                            backgroundColor: Colors.teal,
                          ),
                          subtitle: "开启后将适配横屏平板",trailing: Switch.adaptive(value: ipadmod, onChanged: (val){
                            setState(() {
                              ipadmod = val;
                              setipadmod(val);
                            });
                          }),
                        )
                      ],
                    ),
                    SettingsGroup(items: [
                      SettingsItem(icons: CupertinoIcons.star_fill, title: "软件作者",onTap: (){
                      //_launchUrl();
                    },subtitle: "CC米饭",iconStyle: IconStyle(backgroundColor: Colors.amberAccent),),
                      SettingsItem(icons: CupertinoIcons.profile_circled, title: "隐私政策",onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>procyview())
                        );
                      },subtitle: "查看隐私政策",iconStyle: IconStyle(backgroundColor: Colors.blue),),
                      SettingsItem(icons: CupertinoIcons.book_fill, title: "服务协议",onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>fuwuvive())
                        );
                      },subtitle: "查看服务协议",iconStyle: IconStyle(backgroundColor: Colors.deepPurpleAccent),)
                    ])

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
