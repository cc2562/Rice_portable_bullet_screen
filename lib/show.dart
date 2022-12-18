import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import  'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import '/fun/cunchu.dart';
//跑马灯
class showthing extends StatefulWidget {
  String textthing = '没有内容哦';
  double linething = 1;
  double frontsizething = 1;
  Color frontcolorthing = Colors.white;
  Color backthing = Colors.black;
  showthing({Key?key,required this.textthing,required this.linething,required this.frontsizething,required this.frontcolorthing,required this.backthing}):super(key: key);
  @override
  State<showthing> createState() => _showthingState();

}

class _showthingState extends State<showthing> {
  int fanxiang = 1;
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
      if(ipadmod == true){
        fanxiang = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return RotatedBox(quarterTurns: fanxiang, child:
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: widget.backthing
      ),
      child:  Marquee(text: widget.textthing,
        style: TextStyle(
            fontSize: widget.frontsizething,
            color: widget.frontcolorthing,
            decoration: TextDecoration.none
        ),
        velocity: widget.linething,
      )
    ),
    );// 横屏显示


  }
}
