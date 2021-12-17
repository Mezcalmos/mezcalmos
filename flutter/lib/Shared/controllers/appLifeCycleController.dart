import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AppLifeCycleController extends GetxController
    with WidgetsBindingObserver {
  final bool logs;
  Map<AppLifecycleState, List<VoidCallback>> callbacks = {
    AppLifecycleState.detached: [],
    AppLifecycleState.inactive: [],
    AppLifecycleState.paused: [],
    AppLifecycleState.resumed: [],
  };

  AppLifeCycleController({this.logs = false});

  Rx<AppLifecycleState> _appState = AppLifecycleState.resumed.obs;
  AppLifecycleState get appState => _appState.value;
  StreamController<bool> _appResumedStreamController = StreamController<bool>();
  Stream<bool> get getAppResumedStream => _appResumedStreamController.stream;
  void attachCallback(AppLifecycleState onState, VoidCallback f) {
    callbacks[onState]!.add(f);
  }

  void cleanCallback(AppLifecycleState state) {
    callbacks[state] = [];
  }

  void cleanAllCallbacks() {
    callbacks.keys.forEach((element) {
      callbacks[element] = [];
    });
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.onClose();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _appResumedStreamController.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState.value = state;
    callbacks[state]!.forEach((f) {
      f();
    });

    if (state == AppLifecycleState.resumed) {
      _appResumedStreamController.add(true);
    }

    mezDbgPrint("[+] AppLifeCycleController :: AppStateChanged :: $state");
  }
}
