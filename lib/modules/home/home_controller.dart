import 'package:get/get.dart';
import '../../application/ui/loader/loader_mixin.dart';
import '../../application/ui/messages/messages_mixin.dart';

class HomeController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  HomeController();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }
}
