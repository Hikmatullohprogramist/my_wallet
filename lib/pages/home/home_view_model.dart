// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:get/get.dart';
import 'package:my_wallet/data/service/service.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getKirim();
  }

  var isLoading = false.obs;
  var kirimList = [].obs;
  var chiqimList = [].obs;

  getKirim() async {
    changeLoading();
    kirimList.value = await ApiService().getKirim();
    changeLoading();
  }

  deleteKirim(int id) {
    changeLoading();
    ApiService().deleteKirim(id);
    getKirim();
    changeLoading();
  }

  getChiqim() async {
    changeLoading();
    chiqimList.value = await ApiService().getChiqim();
    print(chiqimList);
    changeLoading();
  }
  deleteChiqim(int id) {
    changeLoading();
    ApiService().deleteChiqim(id);
    getChiqim();
    changeLoading();
  }


  changeLoading() {
    isLoading.value = !isLoading.value;
  }
}
