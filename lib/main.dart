import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:elegant_notification/elegant_notification.dart';
//颜色选择
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sleek_button/sleek_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'show.dart';
import 'about.dart';
import 'package:permission_handler/permission_handler.dart';
import 'procy.dart';
import 'fuwu.dart';
import 'package:is_first_run/is_first_run.dart';
import '/fun/cunchu.dart';
//权限申请
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(useMaterial3: true),
            home: Home(),
          );
        }
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Uri _url = Uri.parse('./proocy.html');
  Future<void> _lunchYinsi() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
// 以下为字体颜色选择
  Color pickerColor = Color(0xffffffff);
  Color currentColor = Color(0xffffffff);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  void showDialogFunction() async {
    bool? isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("选择颜色"),
          //title 的内边距，默认 left: 24.0,top: 24.0, right 24.0
          //默认底部边距 如果 content 不为null 则底部内边距为0
          //            如果 content 为 null 则底部内边距为20
          //titlePadding: EdgeInsets.all(10),
          //标题文本样式
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          //中间显示的内容
          content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
          //中间显示的内容边距
          //默认 EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0)

        ),
          actions: <Widget>[
            SleekButton(
              child: const Text('确定'),
              style: SleekButtonStyle.light(
                context: context
              ),
              onTap: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    print("弹框关闭 $pickerColor");
  }

//以下为背景颜色
  Color pickcolorback = Color(0xff000000);
  Color currentColorback = Color(0xff000000);

// ValueChanged<Color> callback
  void changeColorback(Color color) {
    setState(() => pickcolorback = color);
  }
  void showback() async {
    bool? isSelect = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("选择颜色"),
          //title 的内边距，默认 left: 24.0,top: 24.0, right 24.0
          //默认底部边距 如果 content 不为null 则底部内边距为0
          //            如果 content 为 null 则底部内边距为20
          //titlePadding: EdgeInsets.all(10),
          //标题文本样式
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          //中间显示的内容
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickcolorback,
              onColorChanged: changeColorback,
            ),
            //中间显示的内容边距
            //默认 EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0)

          ),
          actions: <Widget>[
            SleekButton(
              child: const Text('确定'),
              style: SleekButtonStyle.light(
                context: context
              ),
              onTap: () {
                setState(() => currentColorback = pickcolorback);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    print("弹框关闭 $currentColorback");
  }
  ///sp工具类


  void quanxian() async {

    bool? isSelect = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
        child: AlertDialog(
          title: Text("服务协议和隐私政策"),
          //title 的内边距，默认 left: 24.0,top: 24.0, right 24.0
          //默认底部边距 如果 content 不为null 则底部内边距为0
          //            如果 content 为 null 则底部内边距为20
          //titlePadding: EdgeInsets.all(10),
          //标题文本样式
          titleTextStyle: TextStyle(color: Colors.black87, fontSize: 16),
          //中间显示的内容
          content: Text("请你务必谨慎阅读、充分理解”服务协议“和”隐私政策条款“，如你同意，请点击同意开始接受我们的服务。"),
          actions: <Widget>[
            SleekButton(
              child: const Text('同意'),
              style: SleekButtonStyle.light(
                  context: context
              ),
              onTap: () {
                getit();
                Navigator.of(context).pop();
              },
            ),
            SleekButton(
              child: const Text('不同意'),
              style: SleekButtonStyle.light(
                  context: context
              ),
              onTap: () {

                //Navigator.of(context).pop();
                exit(0);
              },
            ),
            SleekButton(
              child: const Text('阅读隐私政策'),
              style: SleekButtonStyle.light(
                  context: context
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>procyview())
                );
              },
            ),
            SleekButton(
              child: const Text('阅读服务协议'),
              style: SleekButtonStyle.light(
                  context: context
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>fuwuvive())
                );
              },
            ),

          ],
        ),
        );
      },
    );
  }

  bool? _isFirstRun;

  void _checkFirstRun() async {
    bool ifr = await nexttime();
    setState(() {
      _isFirstRun = ifr;
      if(_isFirstRun==false){
        quanxian();
      }
    });
  }

  void initState() {
    super.initState();
    //界面build完成后执行回调函数
    _checkFirstRun();
  }

  var neirong;
  double sliderValue = 90;
  double settextlin = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('米饭随身弹幕'),actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>aboutpage())
          );
        }, icon: Icon(Icons.settings))
      ],),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          //字体大小
          //print("字体大小"+sliderValue.toString());
          //print("滚动速度"+settextlin.toString());
          //print("字颜色"+currentColor.toString());
          //print("背景颜色"+currentColorback.toString());
          //print("内容"+neirong);
          if(sliderValue==null || settextlin == null || currentColor == null || neirong == null){
            ElegantNotification.error(
                title:  Text("出错啦！"),
                description:  Text("显示的文字不能为空"),
            ).show(context);
          }else{
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>showthing(textthing: neirong, linething: settextlin, frontsizething: sliderValue, frontcolorthing: currentColor, backthing: currentColorback))
            );
          }
        },
        icon: Icon(Icons.check),
        label: Text("显示弹幕"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                child: Container(
                  width: MediaQuery.of(context).size.width ,
                  padding: EdgeInsetsDirectional.all(6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("显示的文字"),
                      SizedBox(height: 2.h,),
                      TextField(
                        maxLines: 10,
                        minLines: 2,
                        maxLength: 120,
                        autofocus: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),

                          filled: true,
                          fillColor: Colors.white,
                          hintText:"输入内容",
                          labelText: '展示些什么吧..',
                        ),
                        onChanged: (text) {
                          //print("输入改变时" + text);
                          neirong=text;
                        },
                      ),
                      Text("字体大小"),
                      SizedBox(height: 2.h,),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          //已拖动的颜色
                          //activeTrackColor: Colors.greenAccent,
                          //未拖动的颜色
                          //inactiveTrackColor: Colors.green,

                          //提示进度的气泡的背景色
                          valueIndicatorColor: Colors.blue,
                          //提示进度的气泡文本的颜色
                          valueIndicatorTextStyle: TextStyle(
                            color:Colors.white,
                            fontSize: sliderValue
                          ),

                          //滑块中心的颜色
                          thumbColor: Colors.blueAccent,
                          //滑块边缘的颜色
                          overlayColor: Colors.white,

                          //divisions对进度线分割后，断续线中间间隔的颜色
                          inactiveTickMarkColor: Colors.white,

                        ),
                        child: Slider(value: sliderValue,
                            min:1,
                            label: sliderValue.toInt().toString(),
                            max:180,
                            divisions: 179,
                            onChanged: (text){
                              print('change:$text');
                              setState(() {
                                sliderValue = text;
                              });
                            }),
                      ),
                      Text("滚动速度"),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          //已拖动的颜色
                          //activeTrackColor: Colors.greenAccent,
                          //未拖动的颜色
                          //inactiveTrackColor: Colors.green,

                          //提示进度的气泡的背景色
                          valueIndicatorColor: Colors.blue,
                          //提示进度的气泡文本的颜色
                          valueIndicatorTextStyle: TextStyle(
                              color:Colors.white,
                          ),

                          //滑块中心的颜色
                          thumbColor: Colors.blueAccent,
                          //滑块边缘的颜色
                          overlayColor: Colors.white,

                          //divisions对进度线分割后，断续线中间间隔的颜色
                          inactiveTickMarkColor: Colors.white,

                        ),
                        child: Slider(value: settextlin,
                            min:1,
                            label: settextlin.toInt().toString(),
                            max:1200,
                            divisions: 1200,
                            onChanged: (text){
                              print('change:$text');
                              setState(() {
                                settextlin = text;
                              });
                            }),
                      ),
                      Text("字体颜色"),
                      SizedBox(height: 1.h,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Flex(direction: Axis.horizontal,children: [
                          SleekButton(child: Text("选择颜色"),
                            style: SleekButtonStyle.light(
                              color: currentColor,
                              size: SleekButtonSize.normal,
                              context: context,
                            ),
                          onTap: (){showDialogFunction();},
                          ),
                          SizedBox(width: 2.w,),
                          Text("预览颜色",
                          style: TextStyle(
                            color: currentColor
                          ),
                          )

                        ],),
                      ),
                      SizedBox(height: 2.h,),
                      Text("背景颜色"),
                      SizedBox(height: 1.h,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Flex(direction: Axis.horizontal,children: [
                          SleekButton(child: Text("选择颜色"),
                            style: SleekButtonStyle.light(
                              color: currentColorback,
                              size: SleekButtonSize.normal,
                              context: context,
                            ),
                            onTap: (){showback();},
                          ),
                          SizedBox(width: 2.w,),
                          Text("预览颜色",
                            style: TextStyle(
                                color: currentColorback
                            ),
                          )

                        ],),
                      ),
                      SizedBox(height: 2.h,),
                    ],
                  ),
                )
            ),
            SizedBox(height: 2.h,),
          ],
        ),
      ),
    );
  }
}





