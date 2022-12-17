import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import  'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
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

  @override
  Widget build(BuildContext context) {
    return RotatedBox(quarterTurns: 1, child:
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
