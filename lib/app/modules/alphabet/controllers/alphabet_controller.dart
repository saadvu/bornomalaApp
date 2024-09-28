import 'dart:async';

import 'package:bornomala/app/modules/alphabet/models/alphabet_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlphabetController extends GetxController {
  RxBool isPlaying = false.obs;
  RxList<AlphabetModel> sList = <AlphabetModel>[].obs;
  late Rx<AlphabetModel> sModel;

  final ScrollController scrollCon = ScrollController();

  late Timer timer;

  @override
  void onInit() {
    var args = Get.arguments;
    if (args != null) {
      sList.value = args as List<AlphabetModel>;
      sModel = sList[0].obs;
    }
    super.onInit();
  }

  // start method
  void start() {
    isPlaying.value = true;
    if (sModel.value != sList.first) {
      sModel.value = sList.first;
      scrollCon.jumpTo(0);
    }
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (isPlaying.value) {
        if (sModel.value == sList.last) {
          timer.cancel();
          isPlaying.value = false;
          return;
        }
        int index = sList.indexOf(sModel.value);
        changeAlphabet(
          sList[index + 1],
        );
        if (scrollCon.offset < scrollCon.position.maxScrollExtent) {
          scrollCon.animateTo(
            65.0 * index,
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
          );
        }
      }
    });
  }

  // stop method
  void stop() {
    timer.cancel();
    isPlaying.value = false;
  }

  // focusing the alphabet
  void changeAlphabet(AlphabetModel model) {
    sModel.value = model;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
