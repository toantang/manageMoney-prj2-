import 'package:get/get.dart';

class ChartController extends GetxController {
  var _currentIndexTabCharView = 0.obs;

  get currentIndexTabCharView => _currentIndexTabCharView.value;

  set currentIndexTabCharView(value) {
    _currentIndexTabCharView.value = value;
  }
}