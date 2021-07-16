import 'package:flutter/material.dart';

class ResultProvider extends ChangeNotifier {
  late String _result;

  ResultProvider() {
    initValue();
  }
  // 初期化
  void initValue() {
    _result = "遷移先に移動";
  }

  void refresh() {
    initValue();
    notifyListeners(); // Providerを介してConsumer配下のWidgetがリビルドされる
  }

  void updateText(String str) {
    _result = str;
  }

  void notify() {
    notifyListeners(); // Providerを介してConsumer配下のWidgetがリビルドされる
  }
}