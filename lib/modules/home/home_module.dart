import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../application/modules/module.dart';
import 'home_bindings.dart';
import 'home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
