// ignore_for_file: deprecated_member_use
// import 'dart:js' as js;
// import 'package:app_links/app_links.dart';

// import 'package:file_picker/file_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:open_file_plus/open_file_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
// import 'package:app_links/app_links.dart';
import 'package:flutter_udid/flutter_udid.dart';
// import 'package:platform_device_id/platform_device_id.dart';
import 'package:responsive_ui/responsive_ui.dart';
// import 'package:universal_html/html.dart' as html;
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
// import 'package:html/parser.dart' as htmlparser;
// import 'package:html/dom.dart' as dom;
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:custom_input_text/custom_input_text.dart';
// import 'dart:html';
// import 'package:image_downloader/image_downloader.dart';
// import 'dart:html';
import 'dart:io';
// import 'dart:typed_data';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:intl/intl.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:local_auth/auth_strings.dart';
import 'package:modern_form_esys_flutter_share/modern_form_esys_flutter_share.dart';
// import 'package:local_auth/auth_strings.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:device_info/device_info.dart';
import 'package:local_auth/local_auth.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:dio/dio.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

import 'package:facesliptax/file_models/file_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;

// import 'package:image_picker/image_picker.dart';

// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:facesliptax/dataProvider/loginDetail.dart';
// import 'package:facesliptax/playerWidget.dart';
// import 'package:facesliptax/local_auth_api.dart';
import 'package:facesliptax/message.dart';
// import 'dart:ui';

// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

enum SelectMenu {
  mnuNull,
  // mnuEditG,
  // mnuEditE,
  // mnuCancelPhone,
  // mnuCancelFingerprint,
}

// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }

class MenuState extends State<Menu> {
  final formKey = GlobalKey<FormState>();
  // final formKeyLogin = GlobalKey<FormState>();
  // final formKeyTax = GlobalKey<FormState>();
  // final formKeySlip = GlobalKey<FormState>();
  // final formKeyAbout = GlobalKey<FormState>();
  // final formKeyRegister = GlobalKey<FormState>();
  // final formKeyChangePassword = GlobalKey<FormState>();
  // final formKeyResetPassword = GlobalKey<FormState>();
  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final TextEditingController slipYearCtrl = TextEditingController();
  final TextEditingController taxYearCtrl = TextEditingController();
  final TextEditingController idcardCtrl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController bdCtrl = TextEditingController();
  String processUsr = "register";
  bool firstChk = true;
  // int fontSize=18;
  // bool viewPdf = false;
  int? selectUsr = 1;
  int? selectLogin = 2;
  List<String> processUsrStr = [
    "register",
    "changepwd",
    "resetpwd",
    "changeusr"
  ];
  // String _message = "";
  // String _path = "";
  // String _size = "";
  // String _mimeType = "";
  // File? _imageFile;
  // int _progress = 0;
  String loginBy = "";
  String urlImgLogin = "";
  bool runOneTime = false;
  int itemIndex = 3;
  // SelectMenu _selectMenu = SelectMenu.mnuNull;
  bool unknown = false;
  var _imageRegister, _imageLogin;
  var imagePicker;
  bool networkImg = false;

  String fileName = "";
  int fileSize = 0;
  // late AudioPlayer player;
  String imgLoginTmp = "";
// String loginName="";
  String ext = "";
  String uuid = "";
  String year = "";
  String curMonth = "";
  String curYear = "";

  late PDFDocument document;

  List<FileModel> fileList = [];

  late final String path;
  String _fileUrl = "";
  String _fileName = "";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool isChecked = false;
  // bool fingerPrint = false;
  // bool foundPhoneId = false;
  // bool foundFingerPrint = false;
  // bool errPhone = true;

  bool validReport = false;
  String appTitle = "";

  // bool showthaIDQR = false;
  // String thaIDQR = "";

  final LocalAuthentication auth = LocalAuthentication();
  // _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  bool readyFingerPrint = false;
  String foundUuid = "f", foundIdcard = "";

  bool showPeriod = false;

  String period = "2";
  List<int> year2Period = [];
  bool has2Period = false;
  // bool chkUserPwd = true;

  // static const iosStrings = const IOSAuthMessages(
  //     cancelButton: 'cancel',
  //     goToSettingsButton: 'settings',
  //     goToSettingsDescription: 'Please set up your Touch ID.',
  //     lockOut: 'Please reenable your Touch ID');
  // static const androidStrings = const AndroidAuthMessages(
  //   cancelButton: 'ยกเลิก',
  //   goToSettingsButton: 'ตั้งค่า',
  //   goToSettingsDescription: 'กำหนดค่าสแกนลายนิ้วมือ',
  //   // lockOut: 'เปิดใช้งานการสแกนลายนิ้วมือ'
  // );

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

/*
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }
*/
  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'สแกนลายนิ้วมือเพื่อเข้าระบบสลิปใบรับรองภาษี',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
      print(_isAuthenticating);
    });
  }

  Future<bool> fingerPrintReady() async {
    if (await auth.canCheckBiometrics && await auth.isDeviceSupported()) {
      try {
        // if(await auth.authenticate(
        //    // authenticate configuration
        //    )){
        //        // authenticated
        // }
        return true;
      } on PlatformException catch (exception) {
        // catch the exception
        print(exception);
      }
    }
    return false;
  }

  Future<bool> fingerPrintReadyOld() async {
    String msg = "";
    if (_authorized == 'Authorized') return true;
    // print("_authorized=" + _authorized);
    msg = "_authorized=" + _authorized;
    MsgShow().showMsg(msg, TypeMsg.Warning, context);
    // msg = "_supportState=" + _supportState.toString();
    // MsgShow().showMsg(msg, TypeMsg.Warning, context);
    // if (_supportState != _SupportState.supported) {
    //   return false;
    // }
    if (!await auth.isDeviceSupported())
      // return true;
      //else
      return false;
    await _checkBiometrics();
    // print("_canCheckBiometrics=" + _canCheckBiometrics.toString());
    msg = "_canCheckBiometrics=" + _canCheckBiometrics.toString();
    MsgShow().showMsg(msg, TypeMsg.Warning, context);
    if (!_canCheckBiometrics!) return false;
    await _getAvailableBiometrics();
    // print("_availableBiometrics=" + _availableBiometrics.toString());
    msg = "_availableBiometrics=" + _availableBiometrics.toString();
    MsgShow().showMsg(msg, TypeMsg.Warning, context);
//  if (_availableBiometrics!.contains(BiometricType.face)) {
//         // Face ID.
//       } else

    if (!_availableBiometrics!.contains(BiometricType.fingerprint)) {
      // Touch ID.
      return false;
    }
    // print("_supportState=" + _supportState.toString());

    return true;
  }

/*
  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }
*/
  Future<void> popupFingerPrint() async {
    if (_authorized == 'Authorized') return;
    // await _checkBiometrics();
    // if (!_canCheckBiometrics!) return;
    // await _getAvailableBiometrics();
//  if (_availableBiometrics!.contains(BiometricType.face)) {
//         // Face ID.
//       } else

    // if (!_availableBiometrics!.contains(BiometricType.fingerprint)) {
    //   // Touch ID.
    //   return;
    // }

    // if (_supportState == _SupportState.supported) {
    await _authenticateWithBiometrics();
    // }
  }

  @override
  void dispose() {
    // player.dispose();

    super.dispose();
  }

  Widget buildMsg(LoginDetail loginDetail, String msg) {
    // dom.Document document = htmlparser.parse(msg);
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Responsive(children: <Widget>[
        Div(
            divison: const Division(
              colS: 12,
              colM: 12,
              colL: 12,
            ),
            child: Html(
              // document: document,
              data: msg,
            )), //div
      ]),
    );
  }

  calLogicalWidth(LoginDetail loginDetail) {
    var pixelRatio = View.of(context).devicePixelRatio;

    var logicalScreenSize = View.of(context).physicalSize / pixelRatio;
    loginDetail.logicalWidth = logicalScreenSize.width;
    loginDetail.logicalHeight = logicalScreenSize.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
  }

  Future<void> initPlatformState() async {
    String udid;
    try {
      udid = await FlutterUdid.udid;
    } on PlatformException {
      udid = 'Failed to get UDID.';
    }

    if (!mounted) return;

    setState(() {
      uuid = udid;
      // print(uuid + "***");
    });
  }

  Future<void> chkUuidIdcard() async {
    String url = "https://dbdoh.doh.go.th:9000/existUuid/" + uuid;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
    );

    if (response.contentLength == 0 || response.statusCode != 200) {
      foundUuid = "f";
      foundIdcard = "";
      return;
    }
    Map map;

    if (response.statusCode == 200) {
      map = json.decode(response.body);
      foundIdcard = (map["idcard"]);
      foundUuid = (map["found"]);
    }
  }

/*
Future<Widget>  countRegSizeWin() async {
   return Consumer<LoginDetail>(
        builder: (context, loginDetail, child) => FutureBuilder(
            future: this.getDocumentRep(loginDetail),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasError)
                return Text("ERROR: ${snapshot.error}");
              else //if (snapshot.connectionState== ConnectionState.done)
                return Text("");
            }));
  }
*/

  @override
  initState() {
    /*
    String msg = "";
    String code = Uri.base.queryParameters['code'].toString();
    String error = Uri.base.queryParameters['error'].toString();
    print(error);
    // print(error.length);
    print("*******");
    print(code);
    // print(code.length);
    foundIdcard = "";
    if (error != "null") {
      // print(error);
      // print("user not accept");
      msg = "ผู้ใช้งานไม่ยอมรับการให้ข้อมูล";
      MsgShow().showMsg(msg, TypeMsg.Information, context);
    } else if (code != "null") {
      // print(code);
      // print("user accept");

      WidgetsBinding.instance.addPostFrameCallback((_) //=>
          {
        // thaidLogin(code);
      });
    }
*/
    super.initState();
    // if (!kIsWeb) {
    //   startServer();
    // }
    //you are not allowed to add async modifier to initState
    Future.delayed(Duration.zero, () async {
      //your async 'await' codes goes here
      await initPlatformState();
      // print("uuid=" + uuid);
      // auth.isDeviceSupported().then(
      //       (bool isSupported) => setState(() => _supportState = isSupported
      //           ? _SupportState.supported
      //           : _SupportState.unsupported),
      //     );
      this.readyFingerPrint = await fingerPrintReady();
      if (readyFingerPrint) await chkUuidIdcard();
      // await countRegSizeWin();
    });
    // chkUserPwd = true;

// uuid =  FlutterUdid.udid as String;

    // if (logicalWidth == 0.0) {
    // var pixelRatio = window.devicePixelRatio;
    // var logicalScreenSize = window.physicalSize / pixelRatio;
    // logicalWidth = logicalScreenSize.width;
    // }
/*
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
*/
// readyFingerPrint= await this.fingerPrintReady();
    // player = AudioPlayer();

    // imagePicker = new ImagePicker();
    DateTime now = new DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    year = formatted.split("-")[0];
    year = (int.parse(year) - 1 + 543).toString().trim(); //tax year
    curMonth = formatted.split("-")[1];
    curYear = (int.parse(year) + 1).toString().trim();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // final iOS = IOSInitializationSettings();
    final initSettings =
        InitializationSettings(android: android); //, iOS: iOS);

    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      // onSelectNotification: _onSelectNotification
    );
  }

  Widget buildOptionProcessUsr(LoginDetail loginDetail, {String colorBG = ""}) {
    //select_GE=_selectMenu == SelectMenu.mnuEditG ? 1:2;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [Colors.yellow.shade100, Colors.green.shade100])),
      // decoration: BoxDecoration(
      //     color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
      child: Responsive(children: <Widget>[
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("ลงทะเบียนผู้ใช้งาน"),
            leading: Radio(
              toggleable: false, //unselect ==null
              value: 1,
              groupValue: selectUsr,
              onChanged: (value) {
                selectUsr = value as int?;
                this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("เปลี่ยนรหัสผ่าน"),
            leading: Radio(
              toggleable: false,
              value: 2,
              groupValue: selectUsr,
              onChanged: (value) {
                selectUsr = value as int?;
                this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("กำหนดรหัสผ่านใหม่"),
            leading: Radio(
              toggleable: false, //unselect ==null
              value: 3,
              groupValue: selectUsr,
              onChanged: (value) {
                selectUsr = value as int?;
                this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("เปลี่ยนชื่อผู้ใช้งาน"),
            leading: Radio(
              toggleable: false, //unselect ==null
              value: 4,
              groupValue: selectUsr,
              onChanged: (value) {
                selectUsr = value as int?;
                this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
      ]),
    );
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Widget changePassword(LoginDetail loginDetail) {
    // print(logicalWidth);
    // bool
    // validUser = false,
    // validPassword = false;
    // validIdcard = false;
    idcardCtrl.text = loginDetail.idcard;
    userNameCtrl.text = loginDetail.getUserName;
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                width: loginDetail.logicalWidth * (3 / 5),
                constraints: BoxConstraints(
                    //maxWidth: 600,
                    minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Responsive(children: <Widget>[
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child:
                          buildImage("เปลี่ยนรหัสผ่านผู้ใช้งาน ", loginDetail),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildOptionProcessUsr(loginDetail),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'ชื่อผู้ใช้งาน 3 ตัวอักษรขึ้นไป',
                            labelText: "ชื่อผู้ใช้งาน",
                            icon: Icon(Icons.supervised_user_circle)),
                        controller: userNameCtrl,
                        // isPassword: false,
                        enabled: false,
                        // onfocusColor: Colors.blue.shade300,
                        // isAName:true,

                        // validation: validUser,
                        // onChanged: (value) {
                        //   validUser = userNameCtrl.text.trim().length >= 3;
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'รหัสผ่าน 6 ตัวอักษรขึ้นไป',
                            labelText: "รหัสผ่าน",
                            icon: Icon(Icons.key_outlined)),
                        controller: passwordCtrl,
                        obscureText: true,
                        // onfocusColor: Colors.green.shade300,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (value) => value.toString().trim().length < 6
                            ? 'รหัสผ่าน 6 ตัวอักษรขึ้นไป'
                            : null,
                        // onChanged: (value) {
                        //   validPassword =
                        //       passwordCtrl.text.trim().length >= 6;
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: loginDetail.token == ""
                          ? Text("")
                          : loginBy == "userPassword"
                              ? buildButtonRegister(loginDetail, processUsr)
                              : Text(""),
                    ),
                  ]),
                )),
          ))
    ]);
  }

  Widget resetPassword(LoginDetail loginDetail) {
    // calLogicalWidth();
    // print(logicalWidth);
    // bool validbd = false,
    //     // validUser = false,
    //     validPassword = false,
    //     validIdcard = false;
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                width: loginDetail.logicalWidth * (3 / 5),
                constraints: BoxConstraints(
                    //maxWidth: 600,
                    minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Responsive(children: <Widget>[
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildImage(
                          "กำหนดรหัสผ่านผู้ใช้งานใหม่ ", loginDetail,
                          sizeContainer: (3 / 5)),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildOptionProcessUsr(loginDetail),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'เลขบัตรประชาชน 13 หลัก',
                            labelText: "เลขบัตรประชาชน",
                            icon: Icon(Icons.perm_identity)),
                        controller: idcardCtrl,
                        // isPassword: false,
                        // onfocusColor: Colors.blue.shade300,
                        // isAName:true,

                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (value) =>
                            value.toString().trim().length != 13 ||
                                    !isNumeric(value)
                                ? 'เลขบัตรประชาชน 13 หลัก'
                                : null,
                        // onChanged: (value) {
                        //   validIdcard =
                        //       (idcardCtrl.text.trim().length == 13) &&
                        //           isNumeric(value);
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'วันที่สองหลักเดือนสองหลักปี พ.ศ.สี่หลัก',
                            labelText: "วันเกิด",
                            icon: Icon(Icons.date_range_outlined)),
                        controller: bdCtrl,
                        // isPassword: false,
                        // onfocusColor: Colors.green.shade300,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (value) =>
                            value.toString().trim().length != 8 ||
                                    !isNumeric(value)
                                ? 'วันที่สองหลักเดือนสองหลักปี พ.ศ.สี่หลัก'
                                : null,
                        // onChanged: (value) {
                        //   validbd = (bdCtrl.text.trim().length == 8) &&
                        //       (isNumeric(value));
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: CustomInputText(
                        placeholder: 'ชื่อผู้ใช้งานจะปรากฏขึ้นภายหลัง',
                        icon: Icons.supervised_user_circle,
                        textController: userNameCtrl,
                        isPassword: false,
                        enabled: false,
                        onfocusColor: Colors.blue.shade300,
                        // isAName:true,

                        // validation: validUser,
                        // onChanged: (value) {
                        //   validUser = userNameCtrl.text.trim().length >= 3;
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'รหัสผ่าน 6 ตัวอักษรขึ้นไป',
                            labelText: "รหัสผ่าน",
                            icon: Icon(Icons.key_outlined)),
                        controller: passwordCtrl,
                        obscureText: true,
                        // onfocusColor: Colors.green.shade300,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (value) => value.toString().trim().length < 6
                            ? 'รหัสผ่าน 6 ตัวอักษรขึ้นไป'
                            : null,
                        // onChanged: (value) {
                        //   validPassword =
                        //       passwordCtrl.text.trim().length >= 6;
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildButtonRegister(loginDetail, processUsr),
                    ),
                  ]),
                )),
          ))
    ]);
  }

  Widget register(LoginDetail loginDetail) {
    // calLogicalWidth();
    // print(logicalWidth);
    // bool validUser = false, validPassword = false, validIdcard = false;
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                width: loginDetail.logicalWidth * (3 / 5),
                constraints: BoxConstraints(
                    //maxWidth: 600,
                    minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Responsive(children: <Widget>[
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildImage("ลงทะเบียนผู้ใช้งาน ", loginDetail,
                          sizeContainer: (3 / 5)),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildOptionProcessUsr(loginDetail),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'เลขบัตรประชาชน 13 หลัก',
                            labelText: 'เลขบัตรประชาชน',
                            icon: Icon(Icons.perm_identity)),
                        controller: idcardCtrl,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        // isPassword: false,
                        // onfocusColor: Colors.blue.shade300,
                        // isAName:true,

                        validator: (value) =>
                            value.toString().trim().length != 13 ||
                                    !isNumeric(value)
                                ? 'เลขบัตรประชาชน 13 หลัก'
                                : null,
                        // onChanged: (value) {
                        //   validIdcard =
                        //       (idcardCtrl.text.trim().length == 13) &&
                        //           isNumeric(value);
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'ชื่อผู้ใช้งาน 3 ตัวอักษรขึ้นไป',
                            labelText: 'ชื่อผู้ใช้งาน',
                            icon: Icon(Icons.supervised_user_circle)),
                        controller: userNameCtrl,
                        // isPassword: false,
                        // onfocusColor: Colors.blue.shade300,
                        // isAName:true,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (value) => value.toString().trim().length < 3
                            ? 'ชื่อผู้ใช้งาน 3 ตัวอักษรขึ้นไป'
                            : null,
                        // onChanged: (value) {
                        //   validUser = userNameCtrl.text.trim().length >= 3;
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'รหัสผ่าน 6 ตัวอักษรขึ้นไป',
                            labelText: "รหัสผ่าน",
                            icon: Icon(Icons.key_outlined)),
                        controller: passwordCtrl,
                        obscureText: true,
                        // onfocusColor: Colors.green.shade300,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        validator: (value) => value.toString().trim().length < 6
                            ? 'รหัสผ่าน 6 ตัวอักษรขึ้นไป'
                            : null,
                        // onChanged: (value) {
                        //   validPassword =
                        //       passwordCtrl.text.trim().length >= 6;
                        // }
                      ),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildButtonRegister(loginDetail, processUsr),
                    ),
                  ]),
                )),
          ))
    ]);
  }

/*
  Widget register(LoginDetail loginDetail) {
    calLogicalWidth();
    // print(logicalWidth);
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                constraints:
                    BoxConstraints(maxWidth: 900, minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    //Image.file(image)
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildImage("ลงทะเบียน ", loginDetail),
                      showImg("register", loginDetail),
                      // buildTextFieldEmail(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildCheckBox("phone"),
                            buildTxtMsg("ใช้เฉพาะเครื่องนี้"),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildCheckBox("fingerprint"),
                            buildTxtMsg("ใช้สแกนลายนิ้วมือ"),
                          ]),
                      buildTextFieldIdcard(loginDetail),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SizedBox(
                                child: selectGallery("register"),
                                width: (logicalWidth / 2) - 25,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: SizedBox(
                                child: selectCamera("register"),
                                width: (logicalWidth / 2) - 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildButtonRegister(loginDetail, "register"),
                    ],
                  ),
                )),
          ))
    ]);
  }
*/
/*
  Widget selectCamera(String type) {
    return InkWell(
      onTap: () async {
        networkImg = false;
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          XFile image = await imagePicker.pickImage(
              source: ImageSource.camera,
              imageQuality: 50,
              maxHeight: 500.0,
              maxWidth: 400.0,
              preferredCameraDevice: CameraDevice.front);

          setState(() {
            switch (type) {
              case "register":
                _imageRegister = File(image.path);
                break;
              case "login":
                _imageLogin = File(image.path);
                break;
              default:
            }

            ext = "." + image.name.split(".")[1]; //extension file name ja
          });
        }
      },
      child: Container(
          constraints: BoxConstraints.expand(height: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green[200],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              // combine txt
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  // TextSpan(
                  //   text: "Click ",
                  // ),
                  WidgetSpan(
                    child: Icon(Icons.camera, size: 15),
                  ),
                  TextSpan(
                    text: " กล้อง",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 4),
          padding: EdgeInsets.all(3)),
    );
  }

  Widget selectGallery(String type) {
    return InkWell(
      onTap: () async {
        networkImg = false;
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          XFile image = await imagePicker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 50,
              maxHeight: 500.0,
              maxWidth: 400.0,
              preferredCameraDevice: CameraDevice.front);

          setState(() {
            switch (type) {
              case "register":
                _imageRegister = File(image.path);
                break;
              case "login":
                _imageLogin = File(image.path);
                break;
              default:
            }

            ext = "." + image.name.split(".")[1]; //extension file name ja
          });
        }
      },
      child: Container(
          constraints: BoxConstraints.expand(height: 40.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green[200],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              // combine txt
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  // TextSpan(
                  //   text: "Click ",
                  // ),
                  WidgetSpan(
                    child: Icon(Icons.image_outlined, size: 15),
                  ),

                  TextSpan(
                    text: " รูปภาพ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 4),
          padding: EdgeInsets.all(3)),
    );
  }
*/

  modifyUsr(LoginDetail loginDetail) async {
    String msg = "";
    String url = "https://dbdoh.doh.go.th:9000/";
    switch (processUsr) {
      case "register":
        // if (userNameCtrl.text.trim().length == 0 ||
        //     passwordCtrl.text.trim().length == 0 ||
        //     idcardCtrl.text.trim().length == 0) {
        //   msg = "ต้องบันทึกข้อมูลให้ครบทุกช่อง";
        //   MsgShow().showMsg(msg, TypeMsg.Warning, context);
        //   return;
        // }
        url += "register";
        break;
      case "changepwd":
        // if (passwordCtrl.text.trim().length == 0) {
        //   msg = "ต้องบันทึกข้อมูลให้ครบทุกช่อง";
        //   MsgShow().showMsg(msg, TypeMsg.Warning, context);
        //   return;
        // }
        url += "changepwd/" + loginDetail.id.toString().trim();
        break;
      case "resetpwd":
        // if (bdCtrl.text.trim().length == 0 ||
        //     passwordCtrl.text.trim().length == 0 ||
        //     idcardCtrl.text.trim().length == 0) {
        //   msg = "ต้องบันทึกข้อมูลให้ครบทุกช่อง";
        //   MsgShow().showMsg(msg, TypeMsg.Warning, context);
        //   return;
        // }
        url += "resetpwd/1?bd=" + bdCtrl.text;
        break;
      case "changeusr":
        url += "resetpwd/99?bd=" + bdCtrl.text;
        break;
      default:
    }

    Map<String, String> body = {
      "name": "autoName",
      "username": userNameCtrl.text == "" ? "name" : userNameCtrl.text,
      "password": passwordCtrl.text == "" ? "xxxxxxxxxx" : passwordCtrl.text,
      "email": "6@doh.go.th",
      "idcard": idcardCtrl.text
    };

    http.Response response;
    Map map;
    if (processUsr == "register") {
      response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(body),
      );
      map = json.decode(response.body);
      // print(map);
      if (response.statusCode == 200) {
        userNameCtrl.text = "";
        passwordCtrl.text = "";
        idcardCtrl.text = "";

        msg = "ลงทะเบียนเรียบร้อยแล้ว...";
        MsgShow().showMsg(msg, TypeMsg.Information, context);
      } else {
        msg = map["message"];
        MsgShow().showMsg(msg, TypeMsg.Warning, context);
      }
    } //register
    else if (processUsr == "changepwd") {
      response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + loginDetail.token
        },
        body: jsonEncode(body),
      );
      map = json.decode(response.body);
      // print(map);
      if (response.statusCode == 200) {
        userNameCtrl.text = "";
        passwordCtrl.text = "";
        idcardCtrl.text = "";
        msg = "เปลี่ยนรหัสผ่านเรียบร้อยแล้ว...";
        MsgShow().showMsg(msg, TypeMsg.Information, context);
      } else {
        msg = map["message"];
        MsgShow().showMsg(msg, TypeMsg.Warning, context);
      }
    } //changepwd
    else if (processUsr == "resetpwd" || processUsr == "changeusr") {
      response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(body),
      );
      // print(url);
      // print("***"+response.body+"***");
      // print(body);
      map = json.decode(response.body);
      // print(map);
      if (response.statusCode == 200) {
        userNameCtrl.text = map["username"];
        passwordCtrl.text = "";
        idcardCtrl.text = "";
        bdCtrl.text = "";

        if (processUsr == "resetpwd")
          msg = "กำหนดรหัสผ่านใหม่เรียบร้อยแล้ว...";
        else if (processUsr == "changeusr")
          msg = "กำหนดชื่อผู้ใช้งานใหม่เรียบร้อยแล้ว...";
        MsgShow().showMsg(msg, TypeMsg.Information, context);
      } else {
        msg = map["message"];
        MsgShow().showMsg(msg, TypeMsg.Warning, context);
      }
    } //resetpwd
  }

  Icon changeIcon(String type) {
    Icon icon = Icon(null);
    switch (type) {
      case "register":
        icon = Icon(Icons.app_registration, size: 15);
        break;
      case "resetpwd":
      case "changepwd":
        icon = Icon(Icons.verified_user_outlined, size: 15);
        break;
      case "login":
        icon = Icon(Icons.login, size: 15);
        break;
      case "report":
        icon = Icon(Icons.print, size: 15);
        break;
      case "download":
      case "slip":
        icon = Icon(Icons.preview, size: 15);
        break;
      case "cancelPhone":
        icon = Icon(
          Icons.mobile_off,
          size: 15,
        );
        break;
      case "cancelFingerPrint":
        icon = Icon(
          Icons.fingerprint,
          size: 15,
        );
        break;
      case "regFingerPrint":
      case "fingerPrint":
        icon = Icon(
          Icons.fingerprint,
          size: 15,
        );
        break;
      case "manual":
        icon = Icon(Icons.book_online, size: 15);
        break;
      case "share-download":
      case "share-slip":
        icon = Icon(
          Icons.share_sharp,
          size: 15,
        );
        break;
      case "saveImg":
        icon = Icon(
          Icons.save_as,
          size: 15,
        );
        break;
      default:
    }
    return icon;
  }

  signOut(BuildContext context, LoginDetail loginDetail) {
    // Navigator.pushNamed(context, "/menu");
    // manaualView = false;
    /*
    this.itemIndex = 0;
    loginDetail.idcard = "";
    loginDetail.token = "";
    _imageRegister = null;
    _imageLogin = null;
    validReport = false;
    isChecked = false;
    networkImg = false;
    fingerPrint = false;
    foundFingerPrint=false;
*/
    loginDetail.token = "";
    loginDetail.idcard = "";
    loginDetail.setUserName = "";
    loginDetail.msgLast = "";
    loginDetail.cntregis = "";
    userNameCtrl.text = "";
    passwordCtrl.text = "";
    idcardCtrl.text = "";
    bdCtrl.text = "";
    loginBy = "";

    _authorized = 'Not Authorized';
    _isAuthenticating = false;
    runOneTime = false;
    // readyFingerPrint = false;
    // foundUuid = "f";
    // foundIdcard = "";

    // chkUserPwd = true;
    // if (defaultTargetPlatform == TargetPlatform.android) {
    //   SystemNavigator.pop();
    // } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    //   exit(0);
    // } else {}
    setState(() {});

/*
    if (Platform.isAndroid) {
      SystemNavigator.pop();
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else if (Platform.isIOS) {
      exit(0);
    }
    else {

    }

    setState(() {});
    */
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => MyLoginPage()),
    //     ModalRoute.withName('/'));
  }

  String password = '';

  Widget buildTextFieldIdcard(LoginDetail loginDetail) {
    idcardCtrl.text = loginDetail.idcard;
    RegExp exp;
    String msg = "";
    bool idcardValid = idcardCtrl.text.toString().length == 13 ? true : false;
    return CustomInputText(
      placeholder: 'เลขบัตรประชาชน 13 หลักติดกัน',
      icon: Icons.person,
      textController: idcardCtrl,
      isPassword: false,
      // keyboardType: TextInputType.number,
      validation:
          idcardValid, // if is true, the border of input will be color green else red
      onChanged: (value) {
        if (value.toString().trim().length == 13) {
          exp = RegExp(r"^[\d]{13}$");
          idcardValid = exp.hasMatch(value.toString());
          if (idcardValid) {
            loginDetail.idcard = value.toString();
          } else
            msg = "บันทึกเลขบัตรประชาชนไม่ครบ 13 หลัก";
          print(msg);
        }
      },
    );
  }

  Container buildTextFieldIdcard123(LoginDetail loginDetail) {
    idcardCtrl.text = loginDetail.idcard;
    return Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
            // initialValue: loginDetail.idcard,
            autofocus: true,
            controller: idcardCtrl,
            maxLength: 13,
            validator: (value) =>
                (value.toString().length == 13) && (isNumeric(value.toString()))
                    ? null
                    : "ต้องบันทึกเลขบัตรประชาชน",
            onSaved: (value) {
              loginDetail.idcard = value.toString();
            },
            keyboardType: TextInputType.number,
            // obscureText: true,
            decoration: InputDecoration(
                hintText: "เลขบัตรประชาชน",
                labelText: "เลขบัตรประชาชน",
                icon: Icon(Icons.supervised_user_circle_rounded)),
            style: TextStyle(fontSize: 18, color: Colors.black)));
  }

  Container buildImage(String title1, LoginDetail loginDetail,
      {double sizeContainer = (1 / 3)}) {
    String title2 = " จำนวนผู้ใช้ThaID:ลงทะเบียน:" + loginDetail.cntregis;
    String title3 = " ใช้งานครั้งล่าสุดเมื่อ:" + loginDetail.msgLast;
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(vertical: 3),
      // decoration: BoxDecoration(
      //     color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: Responsive(children: <Widget>[
        // Div(
        //   divison: const Division(
        //     colS: 3,
        //     colM: 2,
        //     colL: 2,
        //   ),
        //   child: Image.asset(
        //     "assets/images/doh.jpg",
        //     height: loginDetail.logicalWidth * 0.08,
        //     width: loginDetail.logicalHeight * 0.03,
        //   ),
        // ),
        Div(
          divison: const Division(
            colS: 9,
            colM: 10,
            colL: 10,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  Text(title1,
                      style: TextStyle(
                          fontSize: 20,
                          // loginDetail.logicalWidth * 0.06 * sizeContainer,
                          color: Colors.black)),
                  Text(title2,
                      style: TextStyle(
                          fontSize: 18,
                          // loginDetail.logicalWidth * 0.05 * sizeContainer,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 12,
            colL: 12,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  Text(title3,
                      style: TextStyle(
                          fontSize: 18,
                          // loginDetail.logicalWidth * 0.045 * sizeContainer,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget showImg(String type, LoginDetail loginDetail) {
    var _image;
    String imgName;
    if (unknown)
      imgName = "UNKNOWN"; // this.uuid;
    else
      imgName = loginDetail.idcard;
    String url =
        "https://dbdoh.doh.go.th:9000/files/" + imgName + ext + "?type=" + type;
    switch (type) {
      case "register":
        if (_imageRegister != null && networkImg == false) {
          _image = File(_imageRegister.path);
        } else if (networkImg) {
          // _image = networkContent;
        }
        break;
      case "login":
        if (_imageLogin != null && networkImg == false) {
          _image = File(_imageLogin.path);
        } else if (networkImg) {
          // _image = networkContent;
          urlImgLogin = url;
        }
        break;
      default:
    }

    return Container(
      width: 400.0,
      height: 150.0,
      decoration: BoxDecoration(color: Colors.blue[50]),
      child: //(_image != null && networkImg==false)
          // ? Image.memory(base64Decode(_image))
          // ?
          networkImg
              ? Image.network(url,
                  width: 400.0, height: 130.0, fit: BoxFit.fitHeight)
              : _image != null
                  ? Image.file(
                      _image,
                      width: 400.0,
                      height: 130.0,
                      fit: BoxFit.fitHeight,
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.red[200]),
                      width: 400.0,
                      height: 50.0,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
    );
  }

  Future<void> uploadFile(LoginDetail loginDetail, String type) async {
    // Uint8List? fileBytes = result.files.first.bytes;
    // String fileName = result.files.first.name;
    // fileUpload = fileName;
    // FocusScope.of(context).unfocus();
    // FocusScope.of(context).requestFocus(new FocusNode());
    String url = "";
    unknown = false;
    //  _authenticateMe();
    if (type == "login") {
      // if (foundFingerPrint && (_authorized != 'Authorized')) {
      //   String msg = "ต้องทำการสแกนลายนิ้วมือก่อนเข้าระบบ";
      //   MsgShow().showMsg(msg, TypeMsg.Warning, context);
      //   return;
      // }
    }

    if (type == "register") {
      bool valid = await isValidIdcard(loginDetail.idcard);
      if (!valid) {
        String msg = "เลขบัตรประชาชนไม่ถูกต้อง(ข้าราชการหรือลูกจ้างประจำ)";
        MsgShow().showMsg(msg, TypeMsg.Warning, context);
        return;
      }

      url = "https://dbdoh.doh.go.th:9000/upload_regis/" +
          loginDetail.idcard +
          ext;
    } else if (type == "login") {
      loginDetail.idcard = "";
      loginDetail.token = "";
      validReport = false;
      imgLoginTmp = this.uuid + ext; //this.uuid    "imgTmp"
      url = "https://dbdoh.doh.go.th:9000/upload_login/" + imgLoginTmp;
    }

    // String status = "";

    if (isChecked && type == "register") {
      // status = "add";
      // print(l[0]);
      // print(l[1]);
      // print(l[2]);
    }
    if (type == "register") {
      // if (await chkNotAllowUse(loginDetail, uuid, status)) return;
    }
    // status = "";
    // if (fingerPrint && type == "register") {
    //   status = "add";
    //   await chkFingerPrint(uuid, status);
    // }

    var _image;
    switch (type) {
      case "register":
        _image = _imageRegister; // File(_imageRegister.path);
        break;
      case "login":
        _image = _imageLogin; // File(_imageLogin.path);
        break;
      default:
    }
    if (_image == null) {
      String msg = "ยังไม่ทำการเลือกรูปภาพ!";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      return;
    }
    // await upload(
    //     fileBytes: fileSize,
    //     fileName: fileName,
    //     loginDetail: loginDetail,
    //     uploadURL: url);

    var headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json;charset=UTF-8',
      "Accept": "application/json; charset=UTF-8",
      // 'Authorization': 'Bearer ' + loginDetail.getToken
    };
    // String fileName = "abc.txt";//    imageFile.path.split("/").last;
    // print(fileName);

    var request = http.MultipartRequest('POST', Uri.parse(url));
    // request.files.add(http.MultipartFile.fromPath(
    //     'file', fileName
    //     )); //
    // request.fields( http.MultipartFile.fromPath('file', fileName));
    request.files.add(await http.MultipartFile.fromPath(
      'file', _image.path,
      // contentType: new MediaType('image', imageType)
    ));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      // print(str);
      var jsonData = json.decode(str);
      var tmp = jsonData["statusFace"].toString().trim().replaceAll("\"", "");
      String msg = "";
      // print(type);
      // print(tmp);
      // print("************************************");
      if (type == "register") {
        if (int.parse(tmp) == 1) {
          // print("Ifsuccess");

          msg = "ลงทะเบียนใบหน้าสำเร็จแล้ว";
          MsgShow().showMsg(msg, TypeMsg.Information, context);
          // await showImgSuccess(type, loginDetail);

          setState(() {
            networkImg = true;
          });
          // await showName(loginDetail, type);
        } else if (int.parse(tmp) == 0) {
          // print("Ifsuccess");
          MsgShow()
              .showMsg("ไม่สามารถตรวจสอบใบหน้าได้", TypeMsg.Warning, context);
        } else if (int.parse(tmp) > 0) {
          // print("Ifsuccess");
          MsgShow()
              .showMsg("มีจำนวนใบหน้ามากกว่าหนึ่ง", TypeMsg.Warning, context);
        } else if (int.parse(tmp) == -1) {
          // print("Ifsuccess");
          MsgShow().showMsg("ไม่สามารถตรวจสอบใบหน้าที่มีการสวมหน้ากากได้",
              TypeMsg.Warning, context);
        }
      } else if (type == "login") {
        // print("number:"+tmp);
        if (tmp.length == 13) {
          // setState(() {});
          loginDetail.idcard = tmp;
          // if (await chkNotAllowUse(loginDetail, uuid, status)) return;
          msg = "เข้าสู่ระบบด้วยใบหน้าสำเร็จแล้ว";
          // print(msg);
          await loginGetToken(loginDetail);

          MsgShow().showMsg(msg, TypeMsg.Information, context);
          // await showImgSuccess(type, loginDetail);

          setState(() {
            networkImg = true;
          });
          // await showName(loginDetail, type);
        } else {
          msg = "ไม่สามารถเข้าระบบได้ ตรวจสอบว่าลงทะเบียนหรือยัง";
          loginDetail.idcard = "";
          validReport = false;
          loginDetail.token = "";
          MsgShow().showMsg(msg, TypeMsg.Warning, context);
          if (tmp == "UNKNOWN") {
            unknown = true;
            networkImg = true;
            setState(() {});
          }
        }

        // print(loginDetail.idcard);
      } //chk login
    } else {
      //status code
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  Widget login(LoginDetail loginDetail) {
    // calLogicalWidth();
    // print(logicalWidth);
    // bool validUser = false, validPassword = false;
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                width: loginDetail.logicalWidth * (1 / 3),
                constraints: BoxConstraints(
                    // maxWidth: 500,
                    minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Responsive(
                    children: <Widget>[
                      Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: buildImage("เข้าระบบ ", loginDetail,
                            sizeContainer: 1 / 3),
                      ), //div

                      buildOptionLogin(loginDetail),

                      selectLogin == 1 ? showUsrPwd(loginDetail) : Text(""),

                      selectLogin == 2 && foundUuid == "f"
                          ? Div(
                              divison: const Division(
                                // offsetS: 4,
                                // offsetM: 4,
                                // offsetL: 4,

                                colS: 12,
                                colM: 12,
                                colL: 12,
                              ),
                              child: Center(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'เลขบัตรประชาชน 13 หลัก',
                                    labelText: 'เลขบัตรประชาชน',
                                    icon: Icon(Icons.perm_identity)),
                                controller: idcardCtrl,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                // isPassword: false,
                                // onfocusColor: Colors.blue.shade300,
                                // isAName:true,

                                validator: (value) =>
                                    value.toString().trim().length != 13 ||
                                            !isNumeric(value)
                                        ? 'เลขบัตรประชาชน 13 หลัก'
                                        : null,
                                // onChanged: (value) {
                                //   validIdcard =
                                //       (idcardCtrl.text.trim().length == 13) &&
                                //           isNumeric(value);
                                // }
                              )),
                            )
                          : Text(""),

                      Div(
                          divison: const Division(
                            colS: 12,
                            colM: 12,
                            colL: 12,
                          ),
                          child: SizedBox(
                            height: 10,
                          )), //div
                      selectLogin == 2 && foundUuid == "f"
                          ? Div(
                              divison: const Division(
                                // offsetS: 4,
                                // offsetM: 4,
                                // offsetL: 4,

                                colS: 12,
                                colM: 12,
                                colL: 12,
                              ),
                              child: Center(
                                  child: buildButtonRegister(
                                      loginDetail, "regFingerPrint")),
                            )
                          : Text(""),

                      Div(
                          divison: const Division(
                            colS: 12,
                            colM: 12,
                            colL: 12,
                          ),
                          child: SizedBox(
                            height: 10,
                          )), //div
                      selectLogin == 2 && foundUuid == "t"
                          ? Div(
                              divison: const Division(
                                // offsetS: 4,
                                // offsetM: 4,
                                // offsetL: 4,

                                colS: 12,
                                colM: 12,
                                colL: 12,
                              ),
                              child: Center(
                                  child: buildButtonRegister(
                                      loginDetail, "fingerPrint")),
                            )
                          : Text(""),

                      Div(
                          divison: const Division(
                            colS: 12,
                            colM: 12,
                            colL: 12,
                          ),
                          child: SizedBox(
                            height: 10,
                          )),
                      selectLogin == 3
                          ? Div(
                              divison: const Division(
                                // offsetS: 4,
                                // offsetM: 4,
                                // offsetL: 4,

                                colS: 12,
                                colM: 12,
                                colL: 12,
                              ),
                              child: Column(
                                children: [
                                  // showthaIDQR
                                  //     ? Center(
                                  //         child: WebView(
                                  //           initialUrl: thaIDQR,
                                  //           javascriptMode:
                                  //               JavascriptMode.unrestricted,
                                  //         ),
                                  //       )
                                  //     : Text(""),
                                  Center(
                                      child: buildButtonRegister(
                                          loginDetail, "thaid")),
                                ],
                              ))
                          : Text(""),
                    ],

                    //div
                  ),
                )),
          ))
    ]);
  }

  Widget showUsrPwd(LoginDetail loginDetail) {
    return Container(
        child: Responsive(children: <Widget>[
      Div(
        divison: const Division(
          colS: 12,
          colM: 12,
          colL: 12,
        ),
        child: TextFormField(
          // enabled: chkUserPwd,
          decoration: InputDecoration(
              hintText: 'ชื่อผู้ใช้งาน 3 ตัวอักษรขึ้นไป',
              labelText: "ชื่อผู้ใช้งาน",
              icon: Icon(Icons.supervised_user_circle)),
          controller: userNameCtrl,
          // isPassword: false,
          // onfocusColor: Colors.blue.shade300,
          // isAName:true,

          style: TextStyle(fontSize: 18, color: Colors.black),
          validator: (value) => value.toString().trim().length < 3
              //&&  this.chkUserPwd
              ? 'ชื่อผู้ใช้งาน 3 ตัวอักษรขึ้นไป'
              : null,
          // onChanged: (value) {
          //   validUser = false;
          //   validUser = userNameCtrl.text.trim().length >= 3;
          // }
        ),
      ), //div
      Div(
          divison: const Division(
            colS: 12,
            colM: 12,
            colL: 12,
          ),
          child: SizedBox(
            height: 10,
          )), //div
      Div(
        divison: const Division(
          colS: 12,
          colM: 12,
          colL: 12,
        ),
        child: TextFormField(
          // enabled: chkUserPwd,
          decoration: InputDecoration(
              hintText: 'รหัสผ่าน 6 ตัวอักษรขึ้นไป',
              labelText: "รหัสผ่าน",
              icon: Icon(Icons.key_outlined)),
          controller: passwordCtrl,
          obscureText: true,
          // onfocusColor: Colors.green.shade300,
          style: TextStyle(fontSize: 18, color: Colors.black),
          validator: (value) => value.toString().trim().length < 6
              // &&     this.chkUserPwd
              ? 'รหัสผ่าน 6 ตัวอักษรขึ้นไป'
              : null,
          // onChanged: (value) {
          //   validPassword = false;
          //   validPassword =
          //       passwordCtrl.text.trim().length >= 6;
          // }
        ),
      ),
      Div(
          divison: const Division(
            colS: 12,
            colM: 12,
            colL: 12,
          ),
          child: SizedBox(
            height: 10,
          )), //div

      Div(
        divison: const Division(
          // offsetS: 4,
          // offsetM: 4,
          // offsetL: 4,

          colS: 12,
          colM: 12,
          colL: 12,
        ),
        child: Center(child: buildButtonRegister(loginDetail, "login")),
      ),
    ]));
  }

  Widget report(LoginDetail loginDetail) {
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
        color: Colors.green[50],
        child: Center(
            child: Container(
          width: loginDetail.logicalWidth * (1 / 3),
          constraints: BoxConstraints(
              // maxWidth: 500,
              minWidth: 450.0),
          // width: 450.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  colors: [Colors.yellow.shade100, Colors.green.shade100])),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Responsive(children: <Widget>[
              Div(
                divison: const Division(
                  colS: 12,
                  colM: 12,
                  colL: 12,
                ),
                child: buildImage("รายงานภาษี ", loginDetail,
                    sizeContainer: (1 / 3)),
              ), //div

              Div(
                divison: const Division(
                  colS: 12,
                  colM: 12,
                  colL: 12,
                ),
                child: buildTextFieldYear("download", loginDetail),
              ), //div
              Div(
                divison: const Division(
                  colS: 12,
                  colM: 12,
                  colL: 12,
                ),
                child: loginDetail.token != ""
                    ? buildButtonRegister(loginDetail, "download")
                    : Text(""),
              ),
              Div(
                divison: const Division(
                  colS: 12,
                  colM: 12,
                  colL: 12,
                ),
                child: loginDetail.token != ""
                    ? buildButtonRegister(loginDetail, "share-download")
                    : Text(""),
              ), //div
            ]),
          ),
        )),
      )
    ]);
  }

  Container buildTextFieldYear456(String type, LoginDetail loginDetail) {
    int min = 0, max = 0;
    if (loginDetail.slipYear == "") {
      loginDetail.slipYear = curYear;
      loginDetail.taxYear = year;
    }
    switch (type) {
      case "slip":
        slipYearCtrl.text = loginDetail.slipYear;
        min = 2564;
        max = int.parse(curYear);
        break;
      case "download":
        taxYearCtrl.text = loginDetail.taxYear;
        min = 2563;
        max = int.parse(year);
        break;
      default:
    }

    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: NumberInputWithIncrementDecrement(
        min: min, max: max, //enabled: false,
        onIncrement: (num newlyIncrementedValue) {
          // print('Newly incrmented value is $newlyIncrementedValue');
          type == "slip"
              ? loginDetail.slipYear = newlyIncrementedValue.toString()
              : loginDetail.taxYear = newlyIncrementedValue.toString();
        },
        onDecrement: (num newlyDecrementedValue) {
          // print('Newly decremented value is $newlyDecrementedValue');
          type == "slip"
              ? loginDetail.slipYear = newlyDecrementedValue.toString()
              : loginDetail.taxYear = newlyDecrementedValue.toString();
        },
        controller: type == "slip" ? slipYearCtrl : taxYearCtrl,
        numberFieldDecoration: InputDecoration(
          border: InputBorder.none,
        ),
        widgetContainerDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Color.fromARGB(255, 129, 228, 118),
              width: 2,
            )),
        incIconDecoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
          ),
        ),
        separateIcons: true,
        decIconDecoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        ),
        incIconSize: 28,
        decIconSize: 28,
        incIcon: Icons.plus_one,
        decIcon: Icons.exposure_neg_1,
      ),
    );
  }

  Container buildTextFieldYear(String type, LoginDetail loginDetail) {
    // bool yearValid = false;
    // int min = 0, max = 0;
    // String yt = this.year;
    // if (type == "slip") yt = curYear;

    // type == "slip" ? slipYearCtrl.text = yt : taxYearCtrl.text = yt;
    if (loginDetail.slipYear == "") {
      loginDetail.slipYear = curYear;
      loginDetail.taxYear = year;
    }
    switch (type) {
      case "slip":
        slipYearCtrl.text = loginDetail.slipYear;
        // yearValid = slipYearCtrl.text.length == 4;
        // min = 2564;
        // max = int.parse(curYear);
        break;
      case "download":
        taxYearCtrl.text = loginDetail.taxYear;
        // yearValid = taxYearCtrl.text.length == 4;
        // min = 2563;
        // max = int.parse(year);
        break;
      default:
    }
    // RegExp exp;
    // String msg = "";

    if (has2Period &&
        type == "slip" &&
        int.parse(loginDetail.slipYear) > 2566) {
      Iterable<int> yearCur = year2Period
          .where((element) => element == int.parse(loginDetail.slipYear));
      if (yearCur.isEmpty)
        showPeriod = false;
      else
        showPeriod = true;
    } else {
      showPeriod = false;
      this.period = "2";
      //
    }

    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: type == "slip" ? 'เริ่ม พ.ศ. 2564' : 'เริ่ม พ.ศ. 2563',
              labelText: type == "slip" ? 'พ.ศ.' : 'พ.ศ. ภาษี',
              icon: Icon(Icons.date_range_outlined)),

          controller: type == "slip" ? slipYearCtrl : taxYearCtrl,
          // initialValue: yt,
          style: TextStyle(fontSize: 18, color: Colors.black),
          validator: //yearValid,
              (value) =>
                  value.toString().trim().length != 4 || !isNumeric(value)
                      ? 'ปี พ.ศ. มี 4 หลัก'
                      : null,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            if (value.toString().trim().length != 4 ||
                !isNumeric(value.toString().trim())) {
              return;
            }

            type == "slip"
                ? loginDetail.slipYear = value.toString()
                : loginDetail.taxYear = value.toString();

            if (has2Period &&
                type == "slip" &&
                int.parse(loginDetail.slipYear) > 2566) {
              Iterable<int> yearCur = year2Period.where(
                  (element) => element == int.parse(loginDetail.slipYear));
              if (yearCur.isEmpty)
                showPeriod = false;
              else
                showPeriod = true;

              setState(() {});
            } else {
              showPeriod = false;
              this.period = "2";
              setState(() {});
            }
          },
          /*
          onSaved: (value) {
            // int data=int.parse(value.toString());
            // if (data >max ) data=max;
            // else if (data <= min) data=min;
            // value=data.toString();
            // type == "slip" ? slipYearCtrl.text=value : taxYearCtrl.text=value;
            if (value.toString().trim().length == 4) {
              exp = RegExp(r"^[\d]{4}$");
              yearValid = exp.hasMatch(value.toString());
              if (yearValid) {
                type == "slip"
                    ? loginDetail.slipYear = value.toString()
                    : loginDetail.taxYear = value.toString();
              } else
                msg = "บันทึกไม่ครบ 4 หลัก";
              print(msg);
            }
          }
          
          ,
          */
          // keyboardType: TextInputType.number,
          // obscureText: true,
        ));
  }

  processReport(
      LoginDetail loginDetail, String mt, String yt, String period) async {
    String url = "https://dbdoh.doh.go.th:9000/repYT/" +
        loginDetail.idcard +
        "?yt=" +
        yt +
        "&mt=" +
        mt +
        "&period=" +
        period;

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + loginDetail.token
      },
      // body: jsonEncode(
      //     <String, String>{"username": userName, "password": password}),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      MsgShow()
          .showMsg("สร้างรายงานเรียบร้อยแล้ว", TypeMsg.Information, context);

      // setState(() {
      //   this.showPreview = true;
      // });
    }
  }

  Future<Widget> getDocumentRep(LoginDetail loginDetail) async {
    // calLogicalWidth(loginDetail);
    await countRegister(loginDetail);
    return Text(""); // if (_supportState == _SupportState.unknown)
    //   return const CircularProgressIndicator();
    // else if (_supportState == _SupportState.supported)
    //   return const Text('This device is supported');
    // else
    //   return const Text('This device is not supported');

    // if (logicalWidth == 0.0) {
    //   var pixelRatio = View.of(context).devicePixelRatio;
    //   var logicalScreenSize = View.of(context).physicalSize / pixelRatio;
    //   logicalWidth = logicalScreenSize.width;
    // }
    /* try {
      if (!this.runOneTime) {
        calLogicalWidth(loginDetail);
        await countRegister(loginDetail);
        
        runOneTime = true;
      }
    } catch (e) {
      print(e);
    }
    */
    // if (uuid==""){
    // List l = await getDeviceDetails();
    // uuid = l[2];
/*
    switch (_selectMenu) {
      // case SelectMenu.mnuCancelFingerprint:
      //   await cancelFingerPrint(loginDetail);
      //   _selectMenu = SelectMenu.mnuNull;
      //   break;
      // case SelectMenu.mnuCancelPhone:
      //   await cancelPhone(loginDetail);
      //   _selectMenu = SelectMenu.mnuNull;
      //   break;
      default:
    }*/
  }

// bool dwnFile=false;
  downloadFile(LoginDetail loginDetail, String type) async {
    if (type == "manual") {
      _fileName = "slipTax.pdf";
      _fileUrl = "https://dbdoh.doh.go.th:9000/files/slipTax.pdf?type=manual";
      await download();
      return;
    } else if (loginDetail.idcard == "" ||
        // !validReport ||
        loginDetail.token == "") {
      MsgShow().showMsg("ยังไม่ได้เข้าสู่ระบบ", TypeMsg.Warning, context);
      return;
    }
    String mt = "00", yt = loginDetail.taxYear;
    switch (type) {
      case "slip":
      case "share-slip":
        mt = curMonth;
        yt = loginDetail.slipYear; //    curYear;
        break;
      default:
    }
    await processReport(loginDetail, mt, yt, this.period); //create report
    MsgShow()
        .showMsg("สร้างรายงานเรียบร้อยแล้ว...", TypeMsg.Information, context);
    if (mt == "00")
      _fileName = loginDetail.taxYear + "-" + loginDetail.idcard + ".pdf";
    else
      _fileName = loginDetail.slipYear +
          "-" +
          mt +
          "-" +
          this.period +
          "-" +
          loginDetail.idcard +
          ".pdf";
    _fileUrl = "https://dbdoh.doh.go.th:9000/downloadRep/" +
        loginDetail.idcard +
        "?yt=" +
        yt +
        "&mt=" +
        mt +
        "&period=" +
        this.period;
// print(type);
//     print(_fileUrl);
    if (type == "share-download" || type == "share-slip")
      await shareFileFromUrl();
    else {
      await download();
      //loadPdfFromUrl
      // setState(() {
      //   viewPdf = true;
      // });
      // defaultTargetPlatform == TargetPlatform.android
      //     ?
      //     :
      // await _downloadRepWeb();
      // }

      //  dwnFile = false;
    }
  }

  /*
  Future<void> _downloadRepWeb() async {
    http.Response response = await http.get(
      Uri.parse(_fileUrl),
      headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer ' + loginDetail.getToken
      },
      // body: jsonEncode(param_body2),
    );

    final bytes = response.bodyBytes;
    final blob = html.Blob([bytes], 'application/pdf');
    String url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, "_blank");
  }
*/

  Future<int> _onSelectNotification(String? json) async {
    final obj = jsonDecode(json!);

    // if (obj['isSuccess']) {
    try {
      // print("****************");
      // print(obj['filePath']);
      // print("****************");
      // String s =
      //     "/data/user/0/th.go.doh.inf.facesliptax/app_flutter/2565-3301500165001.pdf";
      await OpenFile.open(obj['filePath']);
    } catch (e) {
      print("******error open******" + e.toString());
    }

    // print("*****open file=" + obj['filePath']);
    return 0;
    /*
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('${obj['error']}'),
        ),
      );
      return 1;
    }
    */
  }

  // var _progress = "";
  // void _onReceiveProgress(int received, int total) {
  //   if (total != -1) {
  //     setState(() {
  //       _progress = (received / total * 100).toStringAsFixed(2) + "%";
  //       // dwnFile=true;
  //     });
  //   }
  // }

  final Dio _dio = Dio();

  Future<void> _startDownload(String savePath) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      print(_fileUrl);
      final response = await _dio.download(
        _fileUrl, savePath,
        // onReceiveProgress: _onReceiveProgress
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      // if ( !result['isSuccess']) {
      //   MsgShow().showMsg("ไม่พบข้อมูล...", TypeMsg.Warning, context);
      //   return;
      // }
      /* await showNotification(result);*/
      // print("isSuccess=" + result['isSuccess'].toString());
      await _onSelectNotification(jsonEncode(result));
    }
  }

  Future<void> shareFileFromUrl() async {
    var request = await HttpClient().getUrl(Uri.parse(_fileUrl));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file('SlipTaxDOH', _fileName, bytes, 'application/pdf');
  }

  Future<bool> requestPermissions() async {
    //  var permission = await PermissionHandler()
    // .checkPermissionStatus(PermissionGroup.storage);
    var permission = await Permission.storage.status;

    if (permission != PermissionStatus.granted) {
      // await Permission.requestPermissions([PermissionGroup.storage]);
      permission = await Permission.storage.request();
      permission = await Permission.storage.status;
      // permission = await PermissionHandler()
      //     .checkPermissionStatus(PermissionGroup.storage);
    }

    return permission == PermissionStatus.granted;
  }

  Future<Directory?> getDownloadDirectory() async {
    // if (Platform.isAndroid) {

    //   return await DownloadsPathProvider.downloadsDirectory;
    // }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary

    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }

  Future<void> showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails('channel id', 'channel name',
        channelDescription: 'channel description',
        priority: Priority.high,
        importance: Importance.max);
    // final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android: android); //, iOS: iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
        0, // notification id
        isSuccess ? 'Success' : 'Failure',
        isSuccess
            ? 'ดาวน์โหลดรายงานเสร็จแล้ว!'
            : 'มีข้อผิดพลาดในการดาวน์โหลดไฟล์.',
        platform,
        payload: json);
  }

/*
  Container buildTextFieldPercentDownload() {
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
            initialValue: "", // _progress,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.supervised_user_circle_rounded)),
            style: TextStyle(fontSize: 16, color: Colors.black)));
  }
*/
  Future<bool> isValidIdcard(String idcard) async {
    bool valid = false;
    String url = "https://dbdoh.doh.go.th:9000/isValidIdcard/" + idcard;
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      // body: jsonEncode(
      //     <String, String>{"username": userName, "password": password}),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var ret = jsonDecode(response.body);
      valid = ret["found"];
    }
    return valid;
  }

  Future<void> countRegister(LoginDetail loginDetail) async {
    // String url = "https://dbdoh.doh.go.th:9000/cnt_regis";
    String url = "https://dbdoh.doh.go.th:9000/cntRigisterStr";

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      // body: jsonEncode(
      //     <String, String>{"username": userName, "password": password}),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      Map ret = jsonDecode(response.body);
      // print ("a"+ret+"a");
      loginDetail.cntregis = ret["thaid"] +
          "/" +
          ret["total"]; //   ret.toString(); //  ["count"].toString();
      // print(loginDetail.cntregis);
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.green;
  }

/*
  buildCheckBox(String status) {
    // print(status);
    // print(readyFingerPrint);
    return Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
        child: Switch(
            // checkColor: Colors.white,
            // fillColor: MaterialStateProperty.resolveWith(getColor),
            value: status == "phone"
                ? isChecked
                : status == "fingerprint"
                    ? fingerPrint
                    : false,
            onChanged: (bool? value) {
              setState(() {
                // isChecked = value!;
                status == "phone"
                    ? isChecked = value!
                    : status == "fingerprint" //&& readyFingerPrint
                        ? fingerPrint = value!
                        : fingerPrint = false;
                // print(isChecked);
              });
            }));
  }
*/
  buildTxtMsg(String msg, LoginDetail loginDetail) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(msg,
              style: TextStyle(
                  fontSize: loginDetail.logicalWidth * 0.03,
                  color: Colors.black))),
    );
  }

/*
  static Future<List<String>> getDeviceDetails() async {
    String deviceName = "";
    String deviceVersion = "";
    String identifier = "99999";
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        // if (build.isPhysicalDevice) {
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
        // }
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        // if (data.isPhysicalDevice) {
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
        // }
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

// if (!mounted) return[];
    return [deviceName, deviceVersion, identifier];
  }
*/
  Future<void> loginGetToken(LoginDetail loginDetail) async {
    // if (userNameCtrl.text.trim().length == 0 ||
    //     passwordCtrl.text.trim().length == 0) {
    //   String msg = "ต้องบันทึกค่าแต่ละช่องข้อมูลก่อน...";
    //   MsgShow().showMsg(msg, TypeMsg.Warning, context);
    //   return;
    // }

    String url = "https://dbdoh.doh.go.th:9000/login";

    String username = "", password = "";
    loginDetail.token = "";
    loginDetail.idcard = "";

    // final String res = await rootBundle.loadString('assets/user.json');
    // final data = await json.decode(res);
    // username = data["username"];
    // password = data["password"];
    username = userNameCtrl.text;
    password = passwordCtrl.text;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
          <String, String>{"username": username, "password": password}),
    );

    if (response.contentLength == 0 || response.statusCode != 200) {
      String msg = "ชื่อหรือรหัสผ่านไม่ถูกต้อง";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      return;
    }
    Map map;

    if (response.statusCode == 200) {
      map = json.decode(response.body);
      loginDetail.token = (map["accessToken"]);
// print(map);
      url = "https://dbdoh.doh.go.th:9000/userLogin/" + username;
      response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + loginDetail.token
        },
      );
      map = json.decode(response.body);
      // print(map);
      String msgLast = "";
      if (response.statusCode == 200) {
        loginDetail.idcard = (map["idcard"]);
        loginDetail.id = (map["id"]);
        msgLast = await getLastLogin(loginDetail.idcard);
        loginDetail.msgLast = msgLast;
        insertLastLogin(loginDetail.idcard, "sp");
      }
//2period
      url = "https://dbdoh.doh.go.th:9000/user2Period/" + loginDetail.idcard;
      response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + loginDetail.token
        },
      );
      map = json.decode(response.body);
      // print(map);
      has2Period = false;
      year2Period = [];
      if (response.statusCode == 200) {
        String found = (map["found"]);
        if (found == "true") {
          has2Period = true;
          year2Period = json.decode(map["year"]).cast<int>().toList();
        }
      }
// print(has2Period.toString()+":has2period");
// print(year2Period);
//2period
// print(loginDetail.id);
      // debugPrint(loginDetail.token);
      String msg = "ยินดีต้อนรับเข้าสู่ระบบงาน";
      MsgShow().showMsg(msg, TypeMsg.Information, context);
      loginDetail.setUserName = userNameCtrl.text;
      loginBy = "userPassword";
      setState(() {
        userNameCtrl.text = "";
        passwordCtrl.text = "";
        bdCtrl.text = "";
        idcardCtrl.text = "";
      });
    }
  }

  Future<void> loginGetTokenFingerPrintOrThaID(
      LoginDetail loginDetail, String app) async {
    // if (userNameCtrl.text.trim().length == 0 ||
    //     passwordCtrl.text.trim().length == 0) {
    //   String msg = "ต้องบันทึกค่าแต่ละช่องข้อมูลก่อน...";
    //   MsgShow().showMsg(msg, TypeMsg.Warning, context);
    //   return;
    // }

    String url = "https://dbdoh.doh.go.th:9000/login";

    String username = "gdbf-7ho9yh'vp^jfy[wx", password = "fingerPrint@Doh";
    loginDetail.token = "";
    loginDetail.idcard = "";

    // final String res = await rootBundle.loadString('assets/user.json');
    // final data = await json.decode(res);
    // username = data["username"];
    // password = data["password"];
    // username = userNameCtrl.text;
    // password = passwordCtrl.text;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
          <String, String>{"username": username, "password": password}),
    );

    if (response.contentLength == 0 || response.statusCode != 200) {
      String msg = "ชื่อหรือรหัสผ่านไม่ถูกต้อง";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      return;
    }
    Map map;

    if (response.statusCode == 200) {
      map = json.decode(response.body);
      loginDetail.token = (map["accessToken"]);
// print(map);
      url = "https://dbdoh.doh.go.th:9000/userLogin/" + username;
      response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + loginDetail.token
        },
      );
      map = json.decode(response.body);
      // print(map);
      String msgLast = "";
      if (response.statusCode == 200) {
        loginDetail.idcard = foundIdcard; //   (map["idcard"]);
        loginDetail.id = (map["id"]);
        msgLast = await getLastLogin(loginDetail.idcard);
        loginDetail.msgLast = msgLast;
        insertLastLogin(loginDetail.idcard, app);
      }
// print(loginDetail.id);
      // debugPrint(loginDetail.token);

//2period
      url = "https://dbdoh.doh.go.th:9000/user2Period/" + loginDetail.idcard;
      response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + loginDetail.token
        },
      );
      map = json.decode(response.body);
      // print(map);
      has2Period = false;
      year2Period = [];
      if (response.statusCode == 200) {
        String found = (map["found"]);
        if (found == "true") {
          has2Period = true;
          year2Period = json.decode(map["year"]).cast<int>().toList();
        }
      }
// print(has2Period.toString()+":has2period");
// print(year2Period);
//2period

      String msg = "ยินดีต้อนรับเข้าสู่ระบบงาน";
      MsgShow().showMsg(msg, TypeMsg.Information, context);
      loginDetail.setUserName = userNameCtrl.text;
      // loginBy = "fingerPrint";
      setState(() {
        userNameCtrl.text = "";
        passwordCtrl.text = "";
        bdCtrl.text = "";
        idcardCtrl.text = "";
      });
    }
  }

/*
  Future<bool> chkUuid(String idcard, String uuid, String status) async {
    bool err = false;
    String url = "https://dbdoh.doh.go.th:9000/idcardUuidIns/" +
        idcard +
        "?uuid=" +
        uuid +
        "&status=" +
        status;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
    );
    Map map = json.decode(response.body);

    if (response.statusCode == 200) {
      foundPhoneId = map["found"];
      errPhone = map["err"];

      return (map["err"]);
    }
    return err;
  }
*/
/*
  Future<bool> chkNotAllowUse(
      LoginDetail loginDetail, String uuid, String status) async {
    bool err = await chkUuid(loginDetail.idcard, uuid, status);

    if (err) {
      validReport = false;
      loginDetail.token = "";
      loginDetail.idcard = "";
      String msg = "เลขบัตรประชาชนนี้ถูกใช้งานที่เครื่องอื่นแล้ว..";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      setState(() {});
    } else
      validReport = true;
    return err;
  }
  */
/*
  Future<bool> cancelPhone(LoginDetail loginDetail) async {
    String url = "https://dbdoh.doh.go.th:9000/delPhone/" + loginDetail.idcard;

    http.Response response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + loginDetail.token
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );
    Map map = json.decode(response.body);

    if (response.statusCode == 200) {
      foundPhoneId = false;
      String msg = "ยกเลิกการใช้งานเฉพาะเครื่องนี้แล้ว..";
      MsgShow().showMsg(msg, TypeMsg.Information, context);
      setState(() {});
      return (map["success"]);
    }
    return false;
  }
*/
  Container buildDropDownMonth(LoginDetail loginDetail) {
    List<DropdownMenuItem<String>> monthName = [
      DropdownMenuItem(value: "01", child: Text("มกราคม")),
      DropdownMenuItem(value: "02", child: Text("กุมภาพันธ์")),
      DropdownMenuItem(value: "03", child: Text("มีนาคม")),
      DropdownMenuItem(value: "04", child: Text("เมษายน")),
      DropdownMenuItem(value: "05", child: Text("พฤษภาคม")),
      DropdownMenuItem(value: "06", child: Text("มิถุนายน")),
      DropdownMenuItem(value: "07", child: Text("กรกฎาคม")),
      DropdownMenuItem(value: "08", child: Text("สิงหาคม")),
      DropdownMenuItem(value: "09", child: Text("กันยายน")),
      DropdownMenuItem(value: "10", child: Text("ตุลาคม")),
      DropdownMenuItem(value: "11", child: Text("พฤศจิกายน")),
      DropdownMenuItem(value: "12", child: Text("ธันวาคม")),
    ];

//loginDetail.getMonth.toString();
    return Container(
      constraints: BoxConstraints(
        minWidth: 500.0,
        // maxWidth: 500.0,
      ),
      // width: 500,
      // alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: new DropdownButton<String>(
        hint: Text("month"),

        focusColor: Colors.black,
        elevation: 8,
        //  autofocus: true,
        //  icon: Icon(Icons.share_arrival_time_outlined,textDirection: TextDirection.ltr,) ,

        style: TextStyle(
          fontSize: 18, //loginDetail.logicalWidth * 0.06 * (1 / 3), //16,
          color: Colors.black,
        ),
        value: curMonth,
        items: monthName,
        onChanged: (value) {
          setState(() {
            curMonth = value.toString();
          });
        },
      ),
    );
  }

  Widget slip(LoginDetail loginDetail) {
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                width: loginDetail.logicalWidth * (1 / 3),
                constraints: BoxConstraints(
                    // maxWidth: 500,
                    minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Responsive(children: <Widget>[
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildImage("รายงานสลิป ", loginDetail,
                          sizeContainer: 1 / 3),
                    ), //div
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildTextFieldYear("slip", loginDetail),
                    ), //div
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildDropDownMonth(loginDetail),
                    ), //div

                    // showPeriod
                    //     ? Div(
                    //         divison: const Division(
                    //           colS: 12,
                    //           colM: 12,
                    //           colL: 12,
                    //         ),
                    //         child: buildOptionPeriod(loginDetail),
                    //       )
                    //     : Text(""),

                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: loginDetail.token != ""
                          ? buildButtonRegister(loginDetail, "slip")
                          : Text(""),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: loginDetail.token != ""
                          ? buildButtonRegister(loginDetail, "share-slip")
                          : Text(""),
                    ),
                  ]),
                )),
          ))
    ]);
  }

/*
  Future<void> showName(LoginDetail loginDetail, String type) async {
    bool done = await findName(loginDetail, "G");
    if (!(done)) {
      await findName(loginDetail, "E");
    }

    String msg = "";
    switch (type) {
      case "register":
        msg = "ขอบคุณ" + loginDetail.loginName + "ที่ลงทะเบียนค่ะ";
        break;
      case "login":
        msg = "ยินดีต้อนรับ" + loginDetail.loginName + "เข้าระบบค่ะ";
        break;
      default:
    }
// https: //dbdoh.doh.go.th:9000/speech2Txt/3301500165001?type=register&msg="สวัสดีชาวโลก"
    String url = "https://dbdoh.doh.go.th:9000/speech2Txt/" +
        loginDetail.idcard +
        "?type=" +
        type +
        "&msg=" +
        msg;

    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer ' + loginDetail.token
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );

    // Map map = json.decode(response.body);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      playSound(loginDetail, type);
    }
  }
*/
  Future<bool> findName(LoginDetail loginDetail, String type) async {
    bool done = false;
    String url = "https://dbdoh.doh.go.th:9000/dpis?idcard=" +
        loginDetail.idcard +
        "&type=" +
        type;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer ' + loginDetail.token
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );
    Map map = json.decode(response.body);
    loginDetail.loginName = "";
    if (response.statusCode == 200) {
      if (map.toString() == "000")
        return false;
      else {
        loginDetail.loginName = map["name"];
        return true;
      }
    }
    return done;
  }

/*
  Future<void> playSound(LoginDetail loginDetail, String type) async {
    _fileUrl = "https://dbdoh.doh.go.th:9000/files/" +
        type +
        loginDetail.idcard +
        ".wav?type=sound";

    await player
        .setUrl(_fileUrl); //json.decode(utf8.decode(response.bodyBytes)));
    player.setVolume(1);
    player.play();
  }
  */
/*
  Future<void> chkFingerPrint(String uuid, String status) async {
    // bool err = false;
    bool ready = await fingerPrintReady();
// print("-----");
// print(ready);
    if (!ready && fingerPrint) {
      String msg = "ไม่สามารถใช้งานสแกนลายนิ้วมือเครื่องนี้ได้..";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      fingerPrint = false;
      setState(() {});
      return;
    }

    String url = "https://dbdoh.doh.go.th:9000/fingerPrintUuidIns/" +
        "?uuid=" +
        uuid +
        "&status=" +
        status;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
    );
    Map map = json.decode(response.body);

    if (response.statusCode == 200) {
      foundFingerPrint = map["found"];
      // print(foundFingerPrint);

      // return (map["err"]);
    }
    // return err;
  }

  Future<bool> cancelFingerPrint(LoginDetail loginDetail) async {
    String url = "https://dbdoh.doh.go.th:9000/delFingerPrint/" + uuid;

    http.Response response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + loginDetail.token
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );
    Map map = json.decode(response.body);

    if (response.statusCode == 200) {
      foundFingerPrint = false;
      String msg = "ยกเลิกการใช้งานสแกนลายนิ้วมือเครื่องนี้แล้ว..";
      MsgShow().showMsg(msg, TypeMsg.Information, context);
      setState(() {});
      return (map["success"]);
    }
    return false;
  }
*/
  calCountRegis(LoginDetail loginDetail) async {
    // if (uuid == "") {
    //   await countRegister(loginDetail);
    //   List l = await getDeviceDetails();
    //   uuid = l[2];
    // }
  }

  Widget about(LoginDetail loginDetail) {
    String msg = "";
    // defaultTargetPlatform == TargetPlatform.android
    //     ? msg = ""
    //     :
    msg = """
<h1>
<p>
ระบบงานใบรับรองภาษีและสลิปเงินเดือนกรมทางหลวง
        ใช้สำหรับข้าราชการและลูกจ้างประจำ
        ชื่อและรหัสผ่านใช้เหมือนกับระบบดาวน์โหลดใบรับรองภาษี/สลิปเงินเดือน
         <a href='https://dbdoh.doh.go.th/yt/'  target="_blank"> https://dbdoh.doh.go.th/yt/</a> </p>\n
        ระบบงานนี้ใช้สำหรับ 
        <ul>
        <li>ใบรับรองภาษี ข้าราชการ,ลูกจ้างประจำ ปัจจุบัน </li>
        <li>ใบรับรองภาษี ข้าราชการ,ลูกจ้างประจำ ผู้รับบำนาญ เกษียณอายุราชการ </li>
        <li>สลิปรายบุคคล ข้าราชการ,ลูกจ้างประจำ ปัจจุบัน </li>
        <li>กรณีผู้เกษียณ เลือกปี พ.ศ.ภาษี ตรงกับปีที่เกษียณ จะมีรายงานสองหน้าโดยหน้าที่ หนึ่งจะเป็นข้อมูลเดือน ม.ค.-ก.ย. หน้าที่สองเป็นเดือน ต.ค.-ธ.ค.</li></ul>
        สอบถามปัญหา 
        ศูนย์เทคโนโลยีสารสนเทศ กรมทางหลวง โทร. 26727 , 26728 ฝ่ายบัญชี โทร. 25035, 25036 
       </h1>
        """;

    return Consumer<LoginDetail>(
        builder: (context, loginDetail, child) =>
            // new FutureBuilder(
            //     future: this.calCountRegis(loginDetail),
            //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting)
            //         return Center(child: CircularProgressIndicator());
            //       else if (snapshot.hasError)
            //         return Text("ERROR: ${snapshot.error}");
            //       else
            //         return
            ListView(scrollDirection: Axis.vertical, children: <Widget>[
              Container(
                  color: Colors.green[50],
                  child: Center(
                    child: Container(
                        width: loginDetail.logicalWidth * (3 / 4),
                        constraints: BoxConstraints(
                          // maxWidth: 900,
                          minWidth: 450.0,
                        ),
                        // width: 450.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(colors: [
                              Colors.yellow.shade100,
                              Colors.green.shade100
                            ])),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Form(
                          key: formKey,
                          child: Column(
                            //Image.file(image)
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buildImage(
                                  "รายละเอียดการใช้งานระบบ ", loginDetail,
                                  sizeContainer: 3 / 4),
                              //buildText("about")
                              buildMsg(loginDetail, msg),
                            ],
                          ),
                        )),
                  ))
            ]));
  }

  Container buildText(String type) {
    String msg = "";
    if (type == "about") {
      msg = "ระบบงานใบรับรองภาษีและสลิปเงินเดือนกรมทางหลวง " +
          "ใช้สำหรับข้าราชการและลูกจ้างประจำ" +
          "ชื่อและรหัสผ่าน\nใช้เหมือนกับระบบดาวน์โหลดใบรับรองภาษี " +
          "https://dbdoh.doh.go.th/yt/ " +
          // " \n" +
          // " \n" +
          // "\n " +
          // " \n" +
          // "\n" +
          " ";
    }

    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              "สวัสดี.." + msg,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          // ElevatedButton(
          //   onPressed: _launchURL,
          //   child: Row(
          //     children: [
          //       Icon(Icons.web),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text("Web salary:https://app.doh.go.th:8088/sal/"),
          //     ],
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: _launchURL2,
          //   child: Row(
          //     children: [
          //       Icon(Icons.mail_sharp),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text("Mail to:suchat.msit04@gmail.com"),
          //     ],
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: _launchURL3,
          //   child: Row(
          //     children: [
          //       Icon(Icons.phone_android),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text("Tel to:+66022063789"),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  // void _launchURL() async {
  //   String url1 = "https://app.doh.go.th:8088/sal/";
  //   if (!await launchUrlString(url1)) throw 'Could not launch $url1';
  // }

  // Future<void> _launchURL2() async {
  //   String url1 =
  //       "mailto:suchat.msit04@gmail.com?subject=Send Information&body=Message";
  //   if (!await launchUrlString(url1)) throw 'Could not launch $url1';
  // }

  // Future<void> _launchURL3() async {
  //   String url1 = "tel:+66022063789";
  //   if (!await launchUrlString(url1)) throw 'Could not launch $url1';
  // }

  // downloadImg(LoginDetail loginDetail) {
  //   _downloadImage(
  //     urlImgLogin,
  //     destination: AndroidDestinationType.directoryPictures
  //       ..inExternalFilesDir()
  //       ..subDirectory(loginDetail.idcard + ext),
  //   );
  // }
/*
  Future<void> _downloadImage(
    String url, {
    AndroidDestinationType? destination,
    bool whenError = false,
    String? outputMimeType,
  }) async {
    String? fileName;
    String? path;
    int? size;
    String? mimeType;
    try {
      var imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(url,
                outputMimeType: outputMimeType)
            // ignore: body_might_complete_normally_catch_error
            .catchError((error) {
          if (error is PlatformException) {
            String? path = "";
            if (error.code == "404") {
              print("Not Found Error.");
            } else if (error.code == "unsupported_file") {
              print("UnSupported FIle Error.");
              path = error.details["unsupported_file_path"];
            }
            setState(() {
              _message = error.toString();
              _path = path ?? '';
              print(_message);
              print(_path);
            });
          }

          print(error);
        }).timeout(Duration(seconds: 10), onTimeout: () {
          print("timeout");
          return;
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(
            url,
            outputMimeType: outputMimeType,
          );
        } else {
          imageId = await ImageDownloader.downloadImage(
            url,
            destination: destination,
            outputMimeType: outputMimeType,
          );
          var path = await ImageDownloader.findPath(imageId);
          await ImageDownloader.open(path!);
        }
      }

      if (imageId == null) {
        return;
      }
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      setState(() {
        _message = error.message ?? '';
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      var location = Platform.isAndroid ? "Directory" : "Photo Library";
      _message = 'Saved as "$fileName" in $location.\n';
      _size = 'size:     $size';
      _mimeType = 'mimeType: $mimeType';
      _path = path ?? '';
      print(_size);
      if (!_mimeType.contains("video")) {
        _imageFile = File(path!);
      }
      print(_imageFile);
      return;
    });
  }
*/
  Future<void> insertLastLogin(String idcard, String app) async {
    String type = "M";
    // DateTime datetime = DateTime.now();
    // String last = datetime.toString();
    String last = ""; //datetime.toString();
    NumberFormat formatter = new NumberFormat("00");
    DateTime _now = DateTime.now();
    String d = formatter.format(_now.day);
    String m = formatter.format(_now.month);
    String y = formatter.format(_now.year + 543);
    String h = formatter.format(_now.hour);
    String mi = formatter.format(_now.minute);
    String s = formatter.format(_now.second);
    last = d + "/" + m + "/" + y + "  " + h + ":" + mi + ":" + s;

    String url = "https://dbdoh.doh.go.th:9000/insertLastLogin?idcard=" +
        idcard +
        "&type=" +
        type +
        "&last='" +
        last +
        "'" +
        "&app=" +
        app;
// print(url);
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );
    // Map map = json.decode(response.body);
// print(map);
    if (response.statusCode == 200) {}
  }

  Future<String> getLastLogin(String idcard) async {
    String url = "https://dbdoh.doh.go.th:9000/findLastLogin?idcard=" + idcard;
// print(url);
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );
    Map map = json.decode(response.body);
    // print(map);
    // print(map.keys.first);
    if (response.statusCode == 200) {
      return map.keys.first;
    }

    return "";
  }

  Widget selectMethod(int choice, LoginDetail loginDetail) {
    switch (choice) {
      case 7:
        if (this.processUsr == "register")
          return register(loginDetail);
        else if (this.processUsr == "changepwd")
          return changePassword(loginDetail);
        else if (this.processUsr == "resetpwd")
          return resetPassword(loginDetail);
        else if (this.processUsr == "changeusr")
          return changeUserName(loginDetail);
        else
          return Text("");
      case 2:
        return login(loginDetail);
      case 3:
        // if (this.viewPdf){
        //   this.viewPdf=false;
        //   return showReport(loginDetail);
        // }
        // else
        return report(loginDetail);
      case 4:
      //return preview(loginDetail);
      case 5:
        // if (this.viewPdf) {
        //     this.viewPdf = false;
        //     return showReport(loginDetail);
        //   } else
        return slip(loginDetail);
      case 6:
        return about(loginDetail);
      default:
    }

    return Text("");
  }

  Widget changeUserName(LoginDetail loginDetail) {
    // calLogicalWidth();
    // print(logicalWidth);
    // bool validbd = false,
    // validUser = false,
    // validPassword = false,
    // validIdcard = false;
    // passwordCtrl.text="xxxxxxxxxx";
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      Container(
          color: Colors.green[50],
          child: Center(
            child: Container(
                width: loginDetail.logicalWidth * (3 / 5),
                constraints: BoxConstraints(
                    //maxWidth: 600,
                    minWidth: 450.0),
                // width: 450.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(colors: [
                      Colors.yellow.shade100,
                      Colors.green.shade100
                    ])),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Responsive(children: <Widget>[
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildImage("กำหนดชื่อผู้ใช้งานใหม่ ", loginDetail,
                          sizeContainer: (3 / 5)),
                    ),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildOptionProcessUsr(loginDetail),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'เลขบัตรประชาชน 13 หลัก',
                              labelText: "เลขบัตรประชาชน",
                              icon: Icon(Icons.perm_identity)),
                          controller: idcardCtrl,
                          // isPassword: false,
                          // onfocusColor: Colors.blue.shade300,
                          // isAName:true,

                          validator: (value) =>
                              value.toString().trim().length != 13 ||
                                      !isNumeric(value)
                                  ? 'เลขบัตรประชาชน 13 หลัก'
                                  : null,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          onSaved: (value) {
                            // validIdcard =
                            //     (idcardCtrl.text.trim().length == 13) &&
                            //         isNumeric(value);
                          }),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText:
                                  'วันที่สองหลักเดือนสองหลักปี พ.ศ.สี่หลัก',
                              labelText: "วันเกิด",
                              icon: Icon(Icons.date_range_outlined)),
                          controller: bdCtrl,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          // isPassword: false,
                          // onfocusColor: Colors.green.shade300,
                          validator: (value) =>
                              value.toString().trim().length != 8 ||
                                      !isNumeric(value)
                                  ? 'วันที่สองหลักเดือนสองหลักปี พ.ศ.สี่หลัก'
                                  : null,
                          onSaved: (value) {
                            // validbd = (bdCtrl.text.trim().length == 8) &&
                            //     (isNumeric(value));
                          }),
                    ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: TextFormField(
                          decoration: InputDecoration(
                              hintText:
                                  'ชื่อผู้ใช้งานใช้ภาษาอังกฤษตัวเลข 3 ตัวขึ้นไป',
                              labelText: "ชื่อผู้ใช้งาน",
                              icon: Icon(Icons.supervised_user_circle)),
                          controller: userNameCtrl,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          // isPassword: false,
                          // onfocusColor: Colors.green.shade300,
                          validator: (value) =>
                              value.toString().trim().length < 3
                                  ? 'ชื่อผู้ใช้งาน 3 ตัวอักษรขึ้นไป'
                                  : null,
                          onSaved: (value) {
                            // validbd = (bdCtrl.text.trim().length == 8) &&
                            //     (isNumeric(value));
                          }),
                    ),
                    // Div(
                    //     divison: const Division(
                    //       colS: 12,
                    //       colM: 12,
                    //       colL: 12,
                    //     ),
                    //     child: SizedBox(
                    //       height: 10,
                    //     )),
                    // Div(
                    //   divison: const Division(
                    //     colS: 12,
                    //     colM: 12,
                    //     colL: 12,
                    //   ),
                    //   child: TextFormField(
                    //       decoration: InputDecoration(
                    //           hintText: 'รหัสผ่าน 6 ตัวอักษรขึ้นไป',
                    //           labelText: "รหัสผ่าน",
                    //           icon: Icon(Icons.key_outlined)),
                    //       controller: passwordCtrl,
                    //       enabled: false,
                    //       obscureText: true,
                    //       // isPassword: true,
                    //       // onfocusColor: Colors.green.shade300,
                    //       style: TextStyle(fontSize: 18, color: Colors.black),
                    //       // validator: (value) =>
                    //       //     value.toString().trim().length < 6
                    //       //         ? 'รหัสผ่าน 6 ตัวอักษรขึ้นไป'
                    //       //         : null,
                    //       onSaved: (value) {
                    //         // validPassword =
                    //         //     passwordCtrl.text.trim().length >= 6;
                    //       }),
                    // ),
                    Div(
                        divison: const Division(
                          colS: 12,
                          colM: 12,
                          colL: 12,
                        ),
                        child: SizedBox(
                          height: 10,
                        )),
                    Div(
                      divison: const Division(
                        colS: 12,
                        colM: 12,
                        colL: 12,
                      ),
                      child: buildButtonRegister(loginDetail, processUsr),
                    ),
                  ]),
                )),
          ))
    ]);
  }

  Widget visibilityPage(LoginDetail loginDetail) {
    int choice = 0;
    bool show = false;
    calLogicalWidth(loginDetail);
    if (!this.runOneTime) {
      countRegister(loginDetail);
      // print(uuid);
      runOneTime = true;
    }

    switch (this.itemIndex) {
      case 4:
        choice = 7;
        show = true;
        // networkImg = false;
        break;
      case 0:
        choice = 2;
        show = true;
        // networkImg = false;
        break;
      case 1:
        choice = 3;
        show = true;

        break;
      case 2:
        choice = 5;
        show = true;

        break;
      case 3:
        choice = 6;

        show = true;
        break;
      default:
    }

    // if (this.showPreview) {
    //   choice = 4;
    //   show = true;
    // }

    return Visibility(
      visible: show,
      child: selectMethod(choice, loginDetail),
    );
  }

  Scaffold menu(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Consumer<LoginDetail>(
          builder: (context, loginDetail, child) => MultiLevelDrawer(
                backgroundColor: Colors.white,
                rippleColor: Colors.white,
                subMenuBackgroundColor: Colors.grey.shade100,
                header: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          //Colors.yellow.shade100, Colors.green.shade100
                          colors: [
                            Colors.yellow.shade100,
                            Colors.green.shade100
                          ])),
                  // Header for Drawer
                  height: loginDetail.logicalHeight *
                      0.25, //    size.height * 0.25,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset("assets/images/doh.jpg",
                      //     width: 40, //loginDetail.logicalWidth * 0.8,
                      //     height: 40 //loginDetail.logicalHeight * 0.3,
                      //     ),
                      SizedBox(
                        height: 3,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "สวัสดี.." + loginDetail.getUserName,
                          style: TextStyle(
                              fontSize: loginDetail.logicalWidth * 0.03,
                              color: Colors.black),
                        ),
                      )
                    ],
                  )),
                ),
                children: [],
              )),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(appTitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          Consumer<LoginDetail>(
            builder: (context, loginDetail, child) => loginDetail.token == ""
                ? Text("")
                : IconButton(
                    icon: Icon(Icons.exit_to_app),
                    color: Colors.white,
                    tooltip: "ออกจากระบบ",
                    iconSize: 50,
                    alignment: Alignment.center,
                    onPressed: () {
                      signOut(context, loginDetail);
                    }),
          ),
        ],
      ),
      body:
          // this.viewPdf?SfPdfViewer.network(
          //         this._fileUrl)
          //         :
          Consumer<LoginDetail>(
              builder: (context, loginDetail, child) =>
                  visibilityPage(loginDetail)
/*
                  FutureBuilder(
                      future: this.getDocumentRep(loginDetail),
                      builder:
                          (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Center(child: CircularProgressIndicator());
                        else if (snapshot.hasError)
                          return Text("ERROR: ${snapshot.error}");
                        else //if (snapshot.connectionState== ConnectionState.done)
                          return visibilityPage(loginDetail);
                      })
                      */
              ),
      bottomNavigationBar: Consumer<LoginDetail>(
        builder: (context, loginDetail, child) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 35,
            mouseCursor: SystemMouseCursors.grab,
            selectedFontSize: 14,
            selectedIconTheme:
                IconThemeData(color: Colors.amberAccent, size: 35),
            selectedItemColor: Colors.amberAccent,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: Colors.blueGrey,
            unselectedIconTheme: IconThemeData(
              color: Colors.deepOrange.shade50, //Accent
            ),
            unselectedItemColor: Colors.deepOrange.shade50,
            items: [
              BottomNavigationBarItem(
                  label: 'เข้าระบบ', icon: Icon(Icons.edit_location_alt_sharp)),
              BottomNavigationBarItem(
                  label: 'ภาษี', icon: Icon(Icons.print_rounded)),
              BottomNavigationBarItem(
                  label: 'สลิป', icon: Icon(Icons.print_rounded)),
              BottomNavigationBarItem(
                  label: 'รายละเอียด', icon: Icon(Icons.attribution_outlined)),
              BottomNavigationBarItem(
                  label: 'ผู้ใช้งาน', icon: Icon(Icons.handyman_outlined)),
            ],
            currentIndex: itemIndex,
            onTap: (index) async {
              // manaualView = false;
              // await getDocumentRep(loginDetail);
              switch (index) {
                case 4:
                  // this.processUsr == "register"
                  //     ? loginDetail.titleBar = "ลงทะเบียน"
                  //     : this.processUsr == "changepwd"
                  //         ? loginDetail.titleBar = "เปลี่ยนรหัสผ่าน"
                  //         : loginDetail.titleBar = "กำหนดรหัสผ่านใหม่";
                  loginDetail.titleBar = "ผู้ใช้งาน";
                  break;
                case 0:
                  loginDetail.titleBar = "เข้าระบบ";
                  // await chkFingerPrint(uuid, "");
                  if (firstChk) {
                    await initPlatformState();
                    this.readyFingerPrint = await fingerPrintReady();
                    if (readyFingerPrint) await chkUuidIdcard();
                    firstChk = !firstChk;
                  }
                  break;
                case 1:
                  loginDetail.titleBar = "ใบรับรองภาษี";
                  break;
                case 2:
                  loginDetail.titleBar = "สลิปเงินเดือน";
                  break;
                case 3:
                  loginDetail.titleBar = "รายละเอียด";

                  break;
                default:
              }
              setState(() {
                // networkImg = false;
                itemIndex = index;
                appTitle = loginDetail.titleBar;
                // this.viewPdf=false;
                // _selectMenu = SelectMenu.mnuNull;
              });
              // if (itemIndex == 1 && foundFingerPrint) {
              //   await popupFingerPrint();
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return menu(context);
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
 Future<bool> chkPermission() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo   android = await plugin.androidInfo;
     final   storageStatus = android.version.sdkInt < 33
          ? await Permission.storage.request()
          : PermissionStatus.granted;
   
    // AndroidDeviceInfo android = await plugin.androidInfo;

    

    if (storageStatus == PermissionStatus.granted) {
      print("****************granted**************");
      return true;
    }
    if (storageStatus == PermissionStatus.denied) {
      print("*******************denied***************");
      return false;
    }
    if (storageStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
    return true;
  }
  Future<void> download() async {
    // if (await canLaunch(_fileUrl)) {
    //   await launch(_fileUrl);
    //   // return;
    // } else {
    //   throw 'Could not launch $_fileUrl';
    // }

    // final
    Directory? dir = //await getApplicationDocumentsDirectory();
        await getExternalStorageDirectory();
    // await getTemporaryDirectory();
    // await  getDownloadDirectory();

    print("dir=$dir");

    // ignore: unused_local_variable
    final savePath;
    if (await chkPermission()){
       final savePath = p.join(dir!.absolute.path, _fileName);
      print("savePath=$savePath");
      await _startDownload(savePath);
    }
    else {

    }
    /*
    if (await Permission.storage.request().isGranted) {
      // Permissions are granted, proceed with directory creation
      if (dir != null) {
        // Create a new directory in the external storage

        //  final savePath = p.join(dir!.absolute.path, _fileName);
        // print("savePath=$savePath");
        // await _startDownload(savePath);
        print("dirPath:${dir.path}");
        Directory newDir = Directory('${dir.path}/rep');
        if (!await newDir.exists()) {
          await newDir.create(recursive: true);
        }
        print('Directory created: ${newDir.path}');
        savePath = p.join(newDir.absolute.path, _fileName);

        await download2(_dio, _fileUrl, savePath);
        print("savePath::::" + savePath);
        //  await OpenFile.open(savePath);
        //  await _startDownload(savePath);
      }
    } else {
      print('Storage permission denied');
    }
    */

/*
    final isPermissionStatusGranted = await requestPermissions();

    
    if (isPermissionStatusGranted) {
      //(dir!.absolute.path, _fileName)
      final savePath = p.join(dir!.absolute.path, _fileName);
      print("savePath=$savePath");
      await _startDownload(savePath);
      // print("1.pass permission");
      // print("##" + savePath + "##");
    } else {
      // handle the scenario when user declines the permissions
      throw "not have permission";
    }
*/
  }

  Widget buildButtonRegister(LoginDetail loginDetail, String type) {
    String msg = "";
    switch (type) {
      case "changeusr":
        msg = "กำหนดชื่อผู้ใช้งานใหม่";
        break;
      case "resetpwd":
        msg = " กำหนดรหัสผ่านใหม่";
        break;
      case "changepwd":
        msg = " เปลี่ยนรหัสผ่าน";
        break;
      case "register":
        msg = " ลงทะเบียน";
        break;
      case "login":
        msg = " เข้าสู่ระบบ";
        break;
      case "thaid":
        msg = " เข้าสู่ระบบด้วยแอป thaID";
        break;

      case "report":
        msg = " รายงาน";
        break;
      // case "saveImg":
      //   msg = " บันทึกรูป(ค้นไฟล์รูปโดยใช้เลข ปชช)";
      //   break;
      // case "cancelPhone":
      //   msg = " ยกเลิกการใช้งานเครื่องนี้";
      //   break;
      // case "cancelFingerPrint":
      //   msg = " ยกเลิกการใช้งานลายนิ้วมือ";
      //   break;
      case "download":
      case "slip":
        msg = " แสดงรายงาน";
        break;
      // case "manual":
      //   msg = "คู่มือ";
      //   break;
      case "share-download":
      case "share-slip":
        msg = " แชร์รายงาน";
        break;
      case "regFingerPrint":
        msg = " ลงทะเบียนลายนิ้วมือ";
        break;
      case "fingerPrint":
        msg = " เข้าระบบด้วยลายนิ้วมือ";
        break;
      default:
    }
    return InkWell(
      onTap: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          if (type == "report")
            print("");
          // await processReport(loginDetail);
          else if (type == "login") {
            // await uploadFile(loginDetail, type);
            // print(formKeyLogin.currentState!.validate());
            // formKeyLogin.currentState!.save();
            await loginGetToken(loginDetail);
          } else if (type == "thaid") {
            if (this.loginBy == "ThaID") return;
            String code = await thaid(loginDetail);
            if (code == "error") return;
            // String code="";int n=0;
            // while (code==""){
            //   code=await resultThaID(loginDetail);
            //   print(n++);
            // }

            // print("code*****receive=$code");
            await thaidLogin(code, loginDetail);
            // print("idcard***=" + this.foundIdcard);
          } else if (type == "download" || type == "slip" || type == "manual") {
            // dwnFile=true;
            await downloadFile(loginDetail, type);
          }
          // else if (type == "cancelPhone") {
          //   await cancelPhone(loginDetail);
          // }
          // else if (type == "cancelFingerPrint") {
          //   await cancelFingerPrint(loginDetail);
          // }
          else if (type == "share-download" || type == "share-slip") {
            await downloadFile(loginDetail, type);
          }
          // else if (type == "saveImg") {
          //   await downloadImg(loginDetail);
          // }
          else if (type == processUsrStr[0]) {
            //register

            modifyUsr(loginDetail);
          } else if (type == processUsrStr[1]) {
            //changepwd

            modifyUsr(loginDetail);
          } else if (type == processUsrStr[2]) {
            //resetpwd

            modifyUsr(loginDetail);
          } else if (type == processUsrStr[3]) {
            //changeusr
            modifyUsr(loginDetail);
          } else if (type == "fingerPrint") {
            if (!this.readyFingerPrint) {
              msg = "ไม่สามารถใช้งานสแกนลายนิ้วมือที่เครื่องนี้ได้";
              MsgShow().showMsg(msg, TypeMsg.Warning, context);
              return;
            }
            await fingerPrint(loginDetail);
          } else if (type == "regFingerPrint") {
            if (!this.readyFingerPrint) {
              msg = "ไม่สามารถใช้งานสแกนลายนิ้วมือที่เครื่องนี้ได้";
              MsgShow().showMsg(msg, TypeMsg.Warning, context);
              return;
            }
            await registerFingerPrint();
          }
        }
      }, //height=40
      child: Container(
          constraints: BoxConstraints.expand(
              height: loginDetail.logicalHeight * 0.06,
              width: (loginDetail.logicalWidth)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green[200],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              // combine txt
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: changeIcon(type),
                  ),
                  TextSpan(
                    text: msg,
                    style: TextStyle(
                        fontSize: 20, // loginDetail.logicalWidth * 0.02,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 4),
          padding: EdgeInsets.all(3)),
    );
  }

  Widget buildOptionLogin(LoginDetail loginDetail, {String colorBG = ""}) {
    //select_GE=_selectMenu == SelectMenu.mnuEditG ? 1:2;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [Colors.yellow.shade100, Colors.green.shade100])),
      // decoration: BoxDecoration(
      //     color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
      child: Responsive(children: <Widget>[
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("ใช้ชื่อผู้ใช้งาน รหัสผ่าน"),
            leading: Radio(
              toggleable: false, //unselect ==null
              value: 1,
              groupValue: selectLogin,
              onChanged: (value) {
                selectLogin = value as int?;
                // this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("ใช้สแกนลายนิ้วมือ"),
            leading: Radio(
              toggleable: false,
              value: 2,
              groupValue: selectLogin,
              onChanged: (value) {
                selectLogin = value as int?;
                // this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("ใช้แอป thaID"),
            leading: Radio(
              toggleable: false, //unselect ==null
              value: 3,
              groupValue: selectLogin,
              onChanged: (value) {
                selectLogin = value as int?;
                // this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> registerFingerPrint() async {
    String url = "https://dbdoh.doh.go.th:9000/idcardUuidIns/" +
        idcardCtrl.text +
        "?uuid=" +
        uuid;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
    );
    bool err = false;
    String msg;
    Map map;
    if (response.contentLength == 0 || response.statusCode != 200) {
      map = json.decode(response.body);
      msg = (map["message"]);
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      return;
    }

    if (response.statusCode == 200) {
      map = json.decode(response.body);
      err = (map["err"]);
    }
    if (err) {
      msg = "เลขบัตรประชาชน " +
          idcardCtrl.text +
          " ถูกใช้งานที่เครื่อง " +
          uuid +
          "  แล้ว";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
    } else {
      msg = "ลงทะเบียนลายนิ้วมือด้วยเลขบัตรประชาชนเรียบร้อยแล้ว ";
      MsgShow().showMsg(msg, TypeMsg.Information, context);
      await chkUuidIdcard();
      setState(() {});
    }
  }

  Future<void> fingerPrint(LoginDetail loginDetail) async {
    await popupFingerPrint();
    if (_authorized == 'Authorized' && loginBy != "fingerPrint") {
      loginBy = "fingerPrint";
      loginGetTokenFingerPrintOrThaID(loginDetail, "sp@fingerPrint");
      setState(() {});
    }
  }

  Widget buildOptionPeriod(LoginDetail loginDetail, {String colorBG = ""}) {
    //select_GE=_selectMenu == SelectMenu.mnuEditG ? 1:2;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [Colors.yellow.shade100, Colors.green.shade100])),
      // decoration: BoxDecoration(
      //     color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
      child: Responsive(children: <Widget>[
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("งวดที่ 1"),
            leading: Radio(
              toggleable: false, //unselect ==null
              value: "1",
              groupValue: period,
              onChanged: (value) {
                period = value as String;
                // this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
        Div(
          divison: const Division(
            colS: 12,
            colM: 4,
            colL: 4,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("งวดที่ 2"),
            leading: Radio(
              toggleable: false,
              value: "2",
              groupValue: period,
              onChanged: (value) {
                period = value as String;
                // this.processUsr = this.processUsrStr[selectUsr! - 1];
                setState(() {});
              },
              activeColor: Colors.green,
            ),
          ),
        ),
      ]),
    );
  }

//   String _status = "";
//   Future<void> startServer() async {
//     final server = await HttpServer.bind('127.0.0.1', 43823);

//     server.listen((req) async {
//       setState(() {
//         this._status = 'Received request!';
//       });

//       req.response.headers.add('Content-Type', 'text/html');

//       // Windows needs some callback URL on localhost
//       /* req.response.write(
//         (Platform.isWindows || Platform.isLinux)
//             ? html.replaceFirst(
//                 'CALLBACK_URL_HERE',
//                 'http://localhost:43824/success?code=1337',
//               )
//             : html.replaceFirst(
//                 'CALLBACK_URL_HERE',
//                 'foobar://success?code=1337',
//               ),
//       );
// */
//       // await req.response.close();
//     });
//   }

  FutureOr<Null> launchUrl1(String url, LaunchMode inAppWebView) {
    launch(url).then(
      (bool isLaunch) async {
        print('isLaunch: $isLaunch');
        if (isLaunch) {
          // Launch Success
          await launch(url,
              forceWebView: true,
              enableDomStorage: true,
              enableJavaScript: true,
              webOnlyWindowName: "_self");
        } else {
          // Launch Fail
        }
      },
      onError: (e) {
        print('onError: $e');
      },
    ).catchError(
      // ignore: invalid_return_type_for_catch_error
      (e) => print(e),
    );
  }

  String redirect_uri = "valid-callback-scheme-sp:/"; //    localhost:43823";
  Future<String> thaid(LoginDetail loginDetail) async {
    // thaIDQR =
    String url =
        "https://imauth.bora.dopa.go.th/api/v2/oauth2/auth/?response_type=code&client_id=bnVzQ2J1NXUwYnV3NmpwdWRDcGlwYWdXa3B4emV4aHo&redirect_uri=${redirect_uri}&scope=pid&state=doh_sp"; // ${Uri.encodeFull(redirect_uri)}
    //%20name%20birthdate
    // final  uri = Uri.parse(url) ;
    //  final uri = Uri.parse(url);
    // print("before");
    String code1 = "error";
    try {
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: "valid-callback-scheme-sp");
// print("result=$result");
      if (Uri.parse(result).queryParameters['error'] != null) {
        String msg = "ผู้ใช้งานไม่ยินยอมการให้ข้อมูล";
        MsgShow().showMsg(msg, TypeMsg.Warning, context);
        // this.signOut(context, loginDetail);
        return "error";
      }
      code1 = Uri.parse(result).queryParameters['code'].toString();
      // print("code1=$code1");
      return code1;

//
/*
result=valid-callback-scheme:/?code=Y2QyZjdmNTktYjQ5MC00ZGY5LWFkMDYtMDdmNzQwNzk5MmEzIzQ4OGU1YmZiLTlmMDgtNGVjNS1hYjY1LTA5ODI3ZDIzNzlhZQ&state=doh_sp
I/flutter ( 8071): code1=Y2QyZjdmNTktYjQ5MC00ZGY5LWFkMDYtMDdmNzQwNzk5MmEzIzQ4OGU1YmZiLTlmMDgtNGVjNS1hYjY1LTA5ODI3ZDIzNzlhZQ

*/

// final token = Uri.parse(result);
//     String at = token.fragment;
//     at = "http://website/index.html?$at"; // Just for easy persing
//     print("at=$at");
//     var accesstoken = Uri.parse(at).queryParameters['access_token'];
//     print('token');
//     print("code2=$accesstoken");
    } on PlatformException catch (e) {
      // If auth is cancelled or any other error - the library
      // throw the exception. We catch it and return the error
      // in a standard way for us. So the root screen has the error answer
      // in the same format both for inner and external browsers
      print("error^^^" + e.toString());
      Navigator.of(context).pop({
        'error': e,
      });
    }

    return code1;
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri,mode: LaunchMode.externalNonBrowserApplication);
    // } else {
    //   // can't launch url
    //   print("****err");
    // }

    // showthaIDQR = true;
    // setState(() {});

    // final url = Uri.https('imauth.bora.dopa.go.th', '/api/v2/oauth2/auth', {
    //   'client_id': 'bnVzQ2J1NXUwYnV3NmpwdWRDcGlwYWdXa3B4emV4aHo',
    //   'redirect_uri': redirect_uri,
    //   'response_type': 'code',
    //   'scope': 'pid',
    //   'state': 'doh_sp',
    // });
    // print(url);
    // url="https://www.google.co.th";
    // if (await canLaunch(url.toString())) {
    //   await launch(url.toString());//, forceSafariVC: true, forceWebView: true);
    // } else {
    //   throw 'Could not launch*** $url';
    // }

    // js.context.callMethod('open', [url, '_self']); //, '_self'
    //
    // this.launchUrl(url);

// final _appLinks = AppLinks(); // AppLinks is singleton

// Subscribe to all events (initial link and further)
    // _appLinks.uriLinkStream.listen((url) {
    //   // Do something (navigation, ...)
    // });
    // print("ก่อนท้องฟ้าจะสดใส");
    // PackageInfo.fromPlatform().then((value) {
    //   print(
    //       value); // Value will be our all details we get from package info package
    // });
    // Present the dialog to the user
    // try {
    // final result =
    //  await FlutterWebAuth.authenticate(
    //     url: url, callbackUrlScheme: "valid-callback-scheme");
    // final String? code = Uri.parse(result).queryParameters['code'];
    // print(code! + "////////////////////");
    // _handleAuthResponse(result);
    // } on PlatformException catch (e) {
    // If auth is cancelled or any other error - the library
    // throw the exception. We catch it and return the error
    // in a standard way for us. So the root screen has the error answer
    // in the same format both for inner and external browsers
    // print("error^^^" + e.toString());
    // Navigator.of(context).pop({
    //   'error': e,
    // });
    // }
// Extract token from resulting url
    // final code = Uri.parse(result).queryParameters['code'];
    // print("******************************");
    // print(code);
    // MsgShow().showMsg("code:" + code.toString(), TypeMsg.Information, context);
// loginDetail.cntregis=code.toString();
// setState(() {

// });
    // url="https://www.google.co.th?code="+code.toString();
    // if (await canLaunch(url)) {
    //   await launch(url, forceSafariVC: true, forceWebView: true);
    // } else {
    //   throw 'Could not launch*** $url';
    // }

    /*
   print(Uri.base.toString()); // http://localhost:8082/game.html?id=15&randomNumber=3.14
  print(Uri.base.query);  // id=15&randomNumber=3.14
  print(Uri.base.queryParameters['randomNumber']); // 3.14
  */
  }

  /*
  Future<String> resultThaID(LoginDetail loginDetail) async {
     String url = "https://dbdoh.doh.go.th:9000/codeThD";
     http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      // body: jsonEncode(
      //     <String, String>{"username": username, "password": password}),
    );

  
    Map map;
String code="";
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      code = (map["code"]);
    }
    if (code=="error") {
      String msg = "ผู้ใช้งานไม่ยินยอมการให้ข้อมูล";
      MsgShow().showMsg(msg, TypeMsg.Warning, context);
      return code;
    }
// print("***code="+code);
return code;
// await thaidLogin(code,loginDetail);
// print("idcard***="+this.foundIdcard);
  }
*/
  thaidLogin(String code, LoginDetail loginDetail) async {
    String url =
        "https://dbdoh.doh.go.th:9000/getIdthaID?code=${code}&redirect_uri=${redirect_uri}";
    // String url = 'https://corsproxy.io/?' +
    //     Uri.encodeComponent(
    //         "https://imauth.bora.dopa.go.th/api/v2/oauth2/token/");
    // String url = 'http://proxy:root3533@backupdoh.doh.go.th:9000/?' +
    //     Uri.encodeComponent(
    //         "https://imauth.bora.dopa.go.th/api/v2/oauth2/token/");

    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        // 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
        // 'Accept': '*/*; charset=UTF-8',
        // 'Authorization':
        //     'Basic Ym5WelEySjFOWFV3WW5WM05tcHdkV1JEY0dsd1lXZFhhM0I0ZW1WNGFIbzpkbGQ2YmtsMWVuTTBPVXN3YW10UGNuTTRWelJTWVhoQmJXOVJhVE00U0hGa2MyRnlUMG80Tnc=',
        // 'Access-Control-Allow-Origin': '*',
        // 'Access-Control-Allow-Headers':
        //     'Origin, X-Requested-With, Content-Type, Accept',
        // 'Access-Control-Allow-Credentials': 'true',
        // 'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH',
      },
      // body: ({
      //   "grant_type": "authorization_code",
      //   "code": code,
      //   "redirect_uri": redirect_uri
      // }),
    );
    Map map = json.decode(response.body);
    // print(map);
    // String msgLast = "";
    if (response.statusCode == 200) {
      // print(map["pid"]);
      bool valid = await isValidIdcard(map["pid"]);
      // print("valid="+valid.toString());
      // print(map["name"]);
      // print(map["birthdate"]);
      if (!valid) {
        MsgShow().showMsg("ระบบงานนี้ใช้เฉพาะข้าราชการ-ลูกจ้างประจำกรมทางหลวง",
            TypeMsg.Warning, context);
        return;
      } else {
        foundIdcard = map["pid"];
        await loginGetTokenFingerPrintOrThaID(loginDetail, "sp@thaid");
        this.loginBy = "ThaID";
      }

      // print(foundIdcard);

      // loginDetail.idcard = (map["idcard"]);
      // loginDetail.id = (map["id"]);
      // msgLast = await getLastLogin(loginDetail.idcard);
      // loginDetail.msgLast = msgLast;
      // insertLastLogin(loginDetail.idcard);
    } //state 200
  }

  // Widget showReport(LoginDetail loginDetail) {
  //   return SfPdfViewer.network(
  //             this._fileUrl);
  // }
/*
Future<bool> isValidIdcard(String idcard) async {
    bool valid = false;
    String url = "https://dbdoh.doh.go.th:9000/isValidIdcard/" + idcard;
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8'
      },
      // body: jsonEncode(
      //     <String, String>{"username": userName, "password": password}),
    );

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var ret = jsonDecode(response.body);
      valid = ret["found"];
    }
    return valid;
  }
*/

/*
  _handleAuthResponse(String response) {
    print("in handle");
    print(response);
    if (response.contains('?code=')) {
      // parsing the auth code from the response
      // the response structure can be different for different providers
      // so this parsing logic should be adjusted for your provider
      final code = response.split('=')[1];
      print("code=" + code);
      // l('build', 'code', code);
      Navigator.of(context).pop({
        'code': code,
      });
      return NavigationDecision.prevent;
    }

    if (response.contains('?error=')) {
      // the error response is also specific for the Github oauth way
      // below is the redirect url structure for the github
      // tark://callback?error=access_denied&error_description=The+user+has+denied+your+application+access.&error_uri=https%3A%2F%2Fdocs.github.com%2Fapps%2Fmanaging-oauth-apps%2Ftroubleshooting-authorization-request-errors%2F%23access-denied
      // your provider can have another url structure, so this  parsing logic should be
      // adjusted
      final error = response.split('=')[1].split('&')[0];
      // l('build', 'error', error);
      Navigator.of(context).pop({
        'error': error,
      });
    }
  }
 */
}

class Menu extends StatefulWidget {
  Menu({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  MenuState createState() => MenuState();
}
