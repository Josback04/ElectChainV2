import 'package:get/get.dart';
import 'package:tfc_vend_18_5h/controllers/controllers.dart';

class VoteDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ElectionController>(() => ElectionController());
  }
}
