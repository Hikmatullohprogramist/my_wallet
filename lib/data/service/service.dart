// ignore_for_file: unnecessary_brace_in_string_interps, library_prefixes

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get_core/src/get_main.dart';
import 'package:my_wallet/data/model/kirim_chiqim_model/chiqim_model.dart';
import 'package:my_wallet/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';

import '../../utils/constantas.dart';
import '../model/base_model.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio();
    dio.options.baseUrl = BASE_URL;
    // dio.interceptors.add(dioRequestInspector.getDioRequestInterceptor());
  }

  Future<void> addHeaders() async {
    dio.options.headers.addAll({'content-Type': 'application/json'});
    return;
  }

  BaseResponse wrapResponse(Response<dynamic> response) {
    if (response.statusCode == 200) {
      try {
        return BaseResponse.fromJson(response.data);
      } catch (e) {
        return BaseResponse("UNSUCCESS", null);
      }
    } else {
      return BaseResponse("UNSUCCESS", null);
    }
  }


  // Start Kirim
  Future<List<KirimModel>> getKirim() async {
    try {
      final response = wrapResponse(await dio.get("/kirim/olish"));

      if (response.status == "success!") {
        return (response.data as List<dynamic>)
            .map((e) => KirimModel.fromJson(e))
            .toList();
      } else {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Kirimni olishda xatolik"),
        ));
      }
    } catch (e) {
      Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
    return [];
  }
  Future<List<KirimModel>> addKirim(String title, String price) async {
    try {
      final response = wrapResponse(await dio.get(
        "/kirim/yangi?izoh=$title&summa=$price",
      ));

      if (response.status == "success!") {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Muvaffaqiyatli kirim qo'shildi"),
        ));

        return (response.data as List<dynamic>)
            .map((e) => KirimModel.fromJson(e))
            .toList();
      } else {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Kirim qoshishda xatolik !!!"),
        ));
      }
    } catch (e) {
      Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }

    return [];
  }
  Future<void> deleteKirim(int id) async {
    try {
      final response = wrapResponse(await dio.delete(
        "/kirim/ochirish/?id=$id",
      ));

      if (response.status == "success!") {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Muvaffaqiyatli kirim ochirildi"),
        ));
      } else {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("kirim ochirishda xatolik !!!"),
        ));
      }
    } catch (e) {
      Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
  }

  //Start Chiqim
  Future<List<ChiqimModel>> getChiqim() async {
    try {
      final response = await dio.get("/chiqim/olish");
      final wrappedResponse = wrapResponse(response);

      if (wrappedResponse.status == "success!") {
        final List<dynamic> data = wrappedResponse.data;
        final List<ChiqimModel> chiqimList =
            data.map((e) => ChiqimModel.fromJson(e)).toList();
        if (kDebugMode) {
          print("DATA KELDI $chiqimList");
        }
        return chiqimList;
      } else {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Chiqim olishda xatolik"),
        ));
      }
    } catch (e) {
      Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }

    return [];
  }
  Future<List<ChiqimModel>> addChiqim(String title, String price) async {
    try {
      final response = wrapResponse(await dio.get(
        "/chiqim/yangi?izoh=$title&summa=$price",
      ));

      if (response.status == "success!") {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Muvaffaqiyatli chiqim qo'shildi"),
        ));

        return (response.data as List<dynamic>)
            .map((e) => ChiqimModel.fromJson(e))
            .toList();
      } else {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Chiqim qoshishda xatolik !!!"),
        ));
      }
    } catch (e) {
      Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }

    return [];
  }
  Future<void> deleteChiqim(int id) async {
    try {
      final response = wrapResponse(await dio.delete(
        "/chiqim/ochirish/?id=$id",
      ));

      if (response.status == "success!") {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Muvaffaqiyatli chiqim ochirildi"),
        ));
      } else {
        Get.showSnackbar(const getX.GetSnackBar(
          messageText: Text("Chiqim ochirishda xatolik !!!"),
        ));
      }
    } catch (e) {
      Get.showSnackbar(getX.GetSnackBar(
        messageText: Text(e.toString()),
      ));
    }
  }



}
