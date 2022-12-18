import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class fuwuvive extends StatefulWidget {
  const fuwuvive({Key? key}) : super(key: key);

  @override
  State<fuwuvive> createState() => _fuwuviveState();
}

class _fuwuviveState extends State<fuwuvive> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("服务协议"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              controller.loadString(r"""
           <html lang="en">
<head>
  <meta charset='utf-8'>
  <meta name='viewport' content='width=device-width'>
  <title>
    服务协议 条款和条件
  </title>
  <style> body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; padding:1em; } </style>
</head>
<body>
<strong>
  条款和条件
</strong> <p>
  下载或使用该应用程序，此条款将自动适用于您——因此，请确保在使用该应用程序之前仔细阅读这些条款。您不得以任何方式复制或修改该应用程序、应用程序的任何部分及我的商标。您无权尝试提取应用程序的源代码，也不应尝试将应用程序翻译成其他语言或制作派生版本。该应用程序本身以及与之相关的所有商标、版权、数据库权利和其他知识产权，仍属于CC米饭.
</p> <p>
  CC米饭致力于确保该应用程序尽可能有用和高效。因此，我保留随时对应用程序进行更改或对其服务收费的权利。如果没有向您明确说明您支付的费用，我永远不会向您收取应用程序或其服务费用。
</p> <p>
  米饭随身弹幕存储并处理您提供给我的个人数据，以便提供我的服务。确保您的手机和对应用程序的访问安全是您的责任。因此，我建议您不要给您的手机越狱或root您的手机，这是删除软件限制和设备官方操作系统所施加的限制的过程。它可能会使您的手机容易受到恶意软件/病毒/恶意程序的攻击，从而损害您手机的安全功能，并且可能意味着米饭随身弹幕无法正常运行或根本无法运行。
</p> <!----> <p>
  您应该意识到，CC米饭在某些情况下不承担任何责任。应用程序的某些功能要求应用程序具有活动的internet连接。连接可以是Wi-Fi，也可以由您的移动网络提供商提供，但如果您无法访问Wi-Fi，并且您没有任何剩余的数据空间，则CC米饭无法对应用程序无法完全正常工作承担责任。
</p> <p></p> <p>
  如果您在Wi-Fi区域外使用该应用程序，您应该记住，您与移动网络提供商的协议条款仍然适用。因此，您的移动提供商可能会向您收取访问应用程序时连接期间的数据成本或其他第三方费用。在使用该应用程序时，您将承担任何此类费用，包括漫游数据费用，前提是您在不关闭数据漫游的情况下在您的母国（即地区或国家）之外使用该应用程序。如果您不是正在使用应用程序的设备的付款人，请注意，我假设您已收到付款人使用该应用程序的许可。
</p> <p>
  同样，CC米饭也不能总是对你使用应用程序的方式负责，也就是说，你需要确保你的设备保持充电状态——如果电池用完了，你不能打开它来使用服务，CC米饭不能承担责任。
</p> <p>
  关于CC米饭对您使用该应用程序的责任，当您使用该应用程序时，请务必记住，尽管我努力确保它在任何时候都是更新和正确运行的，但我依赖第三方向我提供信息，以便我可以向您提供信息。CC米饭对于您因完全依赖应用程序的此功能而遭受的任何直接或间接损失，概不负责。
</p> <p>
  在某个时候，我可能希望更新应用程序。应用程序的需求可能会发生变化，并且如果您想继续使用该应用程序，则需要下载更新。 CC米饭不保证应用程序将始终更新，使其与您相关和或与您设备上安装的版本可以使用。但是，您保证在提供给您时始终接受该应用程序的更新。我也可能停止提供该应用程序，并且可以在不通知您终止的情况下随时终止其使用。除非我另行告知，否则在任何终止后，（a）这些条款授予您的权利和许可将终止；（b）您必须停止使用该应用程序，并且（如果需要）将其从设备中删除。
</p> <p><strong>
  本条款和条件的变更
</strong></p> <p>
  我可能会不时更新我的条款和条件。因此，建议您定期查看此页以了解更改。如有任何更改，我会在本页公布新的条款和条件。
</p> <p>
  这些条款和条件自2022-12-18起生效。
</p> <p><strong>
  联系我们
</strong></p> <p>
  如果您对我的隐私政策有任何疑问或建议，请随时通过syywqs@foxmail.com 与我联系。
</p> <br> 
</body>
</html>
      """);
            },
          )
      ),
    );
  }
}
