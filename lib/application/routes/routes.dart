import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../modules/login/login_module.dart';
class Routes {
  static List<GetPage<dynamic>> routes = [
    ...LoginModule().routers,
  ];
}
