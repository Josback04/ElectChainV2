import 'package:get/get.dart';
import 'package:tfc_vend_18_5h/services/database.dart';
import 'package:tfc_vend_18_5h/controllers/controllers.dart';

class AddCandidateBinding extends Bindings {
  @override
  void dependencies() {
    getData() async {
      var data;
      await DataBase()
          .candidatesStream(Get.find<UserController>().user.id,
              Get.arguments[0].id.toString())
          .then((election) {
        data = election['options'];
        Get.find<ElectionController>().currentElection.options = data;
      });
    }
  }
}
