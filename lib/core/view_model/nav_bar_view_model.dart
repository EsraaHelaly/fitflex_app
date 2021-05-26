import 'package:fitflex_app/view/home_view.dart';
import 'package:fitflex_app/view/profile_view.dart';
import 'package:fitflex_app/view/results_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavBarHomeViewModel extends GetxController {
  int _navValue = 0;
  get navValue => _navValue;
  Widget _currentView = HomeView();
  get currentView => _currentView;

  void changevalue(int selectedvalue) {
    _navValue = selectedvalue;

    switch (selectedvalue) {
      case 0:
        {
          _currentView = HomeView();

          break;
        }
      case 1:
        _currentView = ResultsView();

        break;
      case 2:
        _currentView = ProfileView();

        break;
    }
    update();
  }
}
