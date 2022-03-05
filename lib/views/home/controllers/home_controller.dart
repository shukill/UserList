import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../services/home_apis.dart';

class HomeController extends GetxController {
  RxList allUserList = [].obs;

  // === Loading ===
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllUserList();
    super.onInit();
  }

  void getAllUserList() async {
    try {
      allUserList.clear();
      isLoading(true);
      var res = await HomeApis().getAllUserList();
      allUserList.value = res;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
