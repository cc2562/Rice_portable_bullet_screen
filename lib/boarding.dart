import 'dart:io';
import 'package:flutter/cupertino.dart';
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
import '/fun/cunchu.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      bottomButtonChild: Text("继续"),
      onPressedOnLastPage: () => Navigator.pop(context),
        pages: [
        // To create What's New page like Calendar or Translator
        // examples in the readme, use `WhatsNewPage` widget:

        // Actual code from the Calendar example:
        WhatsNewPage(
          title: const Text("这个版本的新内容"),
          features: [
            // Feature's type must be `WhatsNewFeature`
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.device_phone_landscape,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('平板模式'),
              description: const Text(
                '适配了默认为横屏显示的平板电脑。不会再以奇怪的方向显示文字了',
              ),
            ),
            SizedBox(height: 290.h,)
          ],
        ),

        // To create custom onboarding page, use
        // `CupertinoOnboardingPage` widget:

      ],
    );
  }
}

