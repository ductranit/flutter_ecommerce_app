import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

extension $Rx<T> on Rx<T> {
  void safeUpdate(T value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      this.value = value;
    });
  }
}

extension $RxList<T> on RxList<T> {
  void safeUpdate(List<T> value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      this.value = value;
    });
  }
}
