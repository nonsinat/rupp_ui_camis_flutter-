// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rupp_testing_ui_design_flutter/app/modules/home/view.dart';
import 'package:rupp_testing_ui_design_flutter/constants/theme_constant.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.red,
            size: 32,
          ),
        ),
        centerTitle: true,
        title: CircleAvatar(
          radius: 26,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Scan QR",
                      style: ThemeConstant.textTheme.headline3!.copyWith(
                        color: ThemeConstant.light.colorScheme.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Align frame with QR Code",
                      style: ThemeConstant.textTheme.caption!.copyWith(
                        color: Color(0xFF3A3A3C),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: MediaQuery.of(context).size.height / 3,
                        child: QRView(
                          overlay: QrScannerOverlayShape(
                            borderColor: Colors.red,
                            borderRadius: 0,
                            borderLength: 20,
                            borderWidth: 8,
                          ),
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          onPermissionSet: (ctrl, p) {
                            _onPermissionSet(context, ctrl, p);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {
                      _hide = !_hide;
                    });
                  },
                  color: Colors.black,
                  icon: Icon(_hide == false ? Icons.flash_on : Icons.flash_off),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (result != null) {
        controller.pauseCamera();
        controller.dispose();
        setState(() {
          result = scanData;
        });
      } else {
        Get.off(() => const HomeScreen());
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
