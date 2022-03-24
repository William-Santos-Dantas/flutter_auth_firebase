import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'application/bindings/application_bindings.dart';
import 'application/routes/routes.dart';
import 'application/ui/Application_ui_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBindings(),
      getPages: Routes.routes,
      title: ApplicationUiConfig.title,
      theme: ApplicationUiConfig.theme,
    );
  }
}
