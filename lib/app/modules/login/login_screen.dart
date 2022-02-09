// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/theme_constant.dart';
import '../../widgets/r_inputfield_widget.dart';
import '../home/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _codeController;
  bool? isValidated = true;
  bool isActivateButton = true;
  bool? isSecure = false;
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

      // if (_passwordController.text == "Snat") {
      //   setState(() {
      //     isValidated == true;
      //     print("$isValidated");
      //   });
      // } else {
      //   setState(() {
      //     isValidated == false;
      //     print("$isValidated");
      //   });
      // }
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
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F5),
        body: SafeArea(
          child: SizedBox(
            width: width,
            height: height,
            child: Form(
              key: _formKey,
              child: LayoutBuilder(builder: (context, constraint) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: bodyWidget(height, width, constraint),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New User?",
                          style: ThemeConstant.textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print("register");
                          },
                          child: Text(
                            "Register",
                            style: ThemeConstant.textTheme.bodyMedium!.copyWith(
                              color: ThemeConstant.light.colorScheme.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => HomeScreen());
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: width,
                        height: 69,
                        child: DraggableScrollableSheet(builder: (_, context) {
                          return Container(
                            width: width,
                            color: Colors.red,
                          );
                        }),
                      ),
                    )
                    // Container(
                    //     width: width,
                    //     height: 30,
                    //     alignment: Alignment.bottomCenter,
                    //     child: DraggableScrollableSheet(
                    //         builder: (_, controller) {
                    //       return SingleChildScrollView(
                    //         scrollDirection: Axis.vertical,
                    //         child: Container(
                    //           color: Colors.red,
                    //         ),
                    //       );
                    //     }))
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Stack bodyWidget(double height, double width, BoxConstraints constraints) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          child: Image.asset(
            "assets/images/login_subtract.png",
            fit: BoxFit.fill,
            height: isValidated == true
                ? constraints.maxHeight / 1.5
                : constraints.maxHeight / 1.5,
          ),
        ),
        Positioned(
          top: -80,
          child: Image(
            image: AssetImage("assets/images/logo.png"),
            height: constraints.maxHeight / 4,
          ),
        ),
        Positioned(
          top: 80,
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 20,
              height: 1.3,
              fontWeight: FontWeight.bold,
              fontFamily: "Manrope",
            ),
          ),
        ),
        AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: 120,
            left: 16,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: isValidated == false ? 1 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

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
            )),
        AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: isValidated == true ? 140 : 160,
          child: Container(
            width: constraints.maxWidth * .9,
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: InputFieldWidget(
              controller: _codeController,
              hintText: "Enter Code",
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return value;
                }
                return null;
              },
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: isValidated == true ? 215 : 235,
          child: SizedBox(
            width: constraints.maxWidth * .9,
            child: InputFieldWidget(
              controller: _passwordController,
              hintText: "Enter Password",
              obscureText: isSecure,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return value;
                }
                return null;
              },
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: isValidated == true ? 290 : 310,
          right: 20,
          child: InkWell(
            onTap: () {
              print("Forgot Password?");
            },
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: ThemeConstant.light.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          bottom: isValidated == true ? 45 : 30,
          child: SizedBox(
            width: constraints.maxWidth * .9,
            height: 54,
            child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   onSurface: Colors.blue,
              // ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    ThemeConstant.light.colorScheme.primary),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    isValidated = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                } else {
                  setState(() {
                    isValidated = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Processing Dataasdfadfsdf'),
                    ),
                  );
                }
              },
              // onPressed: isActivateButton
              //     ? () {
              //         setState(() {
              //           isActivateButton = false;
              //         });
              //       }

              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "Manrope",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
