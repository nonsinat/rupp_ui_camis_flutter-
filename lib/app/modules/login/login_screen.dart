// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rupp_testing_ui_design_flutter/app/widgets/r_button_widget.dart';
import '../../../constants/theme_constant.dart';
import '../../widgets/r_inputfield_widget.dart';
import '../home/view.dart';
import '../qr_scanner/qr_scanner_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _codeController;
  final TextEditingController _resetController = TextEditingController();
  bool? isValidated = true;
  bool isActivateButton = true;
  bool? isSecure = false;
  bool? isVerify = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _codeController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordController.addListener(() {
      final isActivateButton = _passwordController.text.isNotEmpty;
      setState(() {
        this.isActivateButton = isActivateButton;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F5),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.to(
              () => QRCodeScreen(),
            );
          },
          // onTapDown: (value) {
          //   Get.to(() => QRCodeScreen());
          //   print("value $value");
          // },
          child: _showBottomBav(),
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 800),
                                child: Image.asset(
                                  "assets/images/login_subtract.png",
                                  fit: BoxFit.fill,
                                  height: 400,
                                ),
                              ),
                              Positioned(
                                top: -80,
                                child: Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  // height: constraints.maxHeight / 4,
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      "Welcome",
                                      style: TextStyle(
                                        fontSize: 20,
                                        height: 1.3,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Manrope",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isValidated == false
                                        ? AnimatedOpacity(
                                            duration:
                                                Duration(milliseconds: 400),
                                            opacity:
                                                isValidated == false ? 1 : 0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Icon(
                                                  Icons.warning_amber_rounded,
                                                  color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Incorrect code or password",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InputFieldWidget(
                                      controller: _codeController,
                                      hintText: "Enter Code",
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return value;
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: isValidated == false ? 0 : 20,
                                    ),
                                    InputFieldWidget(
                                      controller: _passwordController,
                                      hintText: "Enter Password",
                                      validation: (value) {
                                        if (value == null || value.isEmpty) {
                                          return value;
                                        }
                                        return null;
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter setState) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom,
                                                  ),
                                                  child: Container(
                                                    color: Color(0xff757575),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: 63,
                                                            height: 4,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF8F90A6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                  10,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              isVerify == false
                                                                  ? 'Reset password'
                                                                  : "Sinat",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style:
                                                                  ThemeConstant
                                                                      .textTheme
                                                                      .headline5!
                                                                      .copyWith(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              'Enter your phone number for the verification process, we will send 4 digits code to your phone number.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: ThemeConstant
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xFF6B7588),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              "Phone number",
                                                              style: ThemeConstant
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                fontSize: 16,
                                                                color: Color(
                                                                  0xFF6B7588,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InputFieldWidget(
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                _resetController,
                                                            hintText:
                                                                "0123456789",
                                                          ),
                                                          Container(
                                                            width: width,
                                                            height: 50,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            child:
                                                                RButtonWidget(
                                                              backgroundColor:
                                                                  Colors.red,
                                                              title: "Confirm",
                                                              onPressed: () {
                                                                setState(() {
                                                                  isVerify ==
                                                                      true;
                                                                });
                                                                Get.back();
                                                                Get.to(
                                                                  () =>
                                                                      QRCodeScreen(),
                                                                );

                                                                _resetController
                                                                        .text =
                                                                    "sinat";
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            bottom:
                                                isValidated == false ? 8 : 10,
                                            top: isValidated == false ? 0 : 10,
                                          ),
                                          child: Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              color: ThemeConstant
                                                  .light.colorScheme.primary,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Manrope",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width,
                                      height: 48,
                                      child: RButtonWidget(
                                        title: "Login",
                                        backgroundColor: ThemeConstant
                                            .light.colorScheme.primary,
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              isValidated = true;
                                            });
                                            Get.to(() => HomeScreen());
                                          } else {
                                            setState(() {
                                              isValidated = false;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "New User?",
                                style:
                                    ThemeConstant.textTheme.bodySmall!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  print("register");
                                },
                                child: Text(
                                  "Register",
                                  style: ThemeConstant.textTheme.bodySmall!
                                      .copyWith(
                                    color:
                                        ThemeConstant.light.colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showBottomBav() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 24,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Scan QR Code",
            style: ThemeConstant.textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
