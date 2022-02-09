import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rupp_testing_ui_design_flutter/app/modules/login/login_screen.dart';
import 'package:rupp_testing_ui_design_flutter/constants/theme_constant.dart';
import 'package:rupp_testing_ui_design_flutter/helpers/theme_helper.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.light,
      themeMode: ThemeService().theme,
      darkTheme: ThemeConstant.dark,
      home: const LoginScreen(),
    );
  }
}
