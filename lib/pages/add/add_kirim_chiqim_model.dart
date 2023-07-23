import 'package:get/get.dart';
import 'package:my_wallet/data/service/service.dart';
import 'package:my_wallet/pages/home/home_page.dart';

class KirimChiqimViewModel extends GetxController {
  var isLoading = false.obs;

  addKirim(String title, String price) async {
    changeLoading();
  ApiService().addKirim(title, price);
    changeLoading();
    Get.offAll(const HomePage());
  }

  addChiqim(String title, String price) async {
    changeLoading();
    ApiService().addChiqim(title, price);
    changeLoading();
    Get.offAll(const HomePage());
  }

  changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
