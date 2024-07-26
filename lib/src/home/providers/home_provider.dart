import 'package:clean_arch_demo/core/network/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  final SharedPreferences _sp;
  final NetworkService _networkService;

  HomeProvider({required SharedPreferences sp, required NetworkService networkService})
      : _sp = sp,
        _networkService = networkService;
}
