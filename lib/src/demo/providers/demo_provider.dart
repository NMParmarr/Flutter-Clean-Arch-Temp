import 'package:clean_arch_demo/core/data/models/requests/auth_reqs/login_req.dart';
import 'package:clean_arch_demo/core/data/repos/auth_repos/auth_repo.dart';
import 'package:clean_arch_demo/core/network/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/error/exceptions.dart';
import '../../../core/utils/common_toast.dart';
import '../../../core/utils/devlog.dart';

class DemoProvider extends ChangeNotifier {
  final AuthRepo _authRepo;
  final SharedPreferences _sp;
  final NetworkService _networkService;

  DemoProvider({required AuthRepo authRepo, required SharedPreferences sp, required NetworkService networkService})
      : _authRepo = authRepo,
        _sp = sp,
        _networkService = networkService;

  ///
  ///
  ///

  /// LOGIN FOR ADMIN
  ///

  Future<bool> adminLogin({required String email, required String password, bool listen = true}) async {
    bool isSuccess = false;
    try {
      final isNetwork = await _networkService.isConnected;
      if (isNetwork) {
        final req = LoginReq(email: email, password: password);
        final res = await _authRepo.adminLogin(req);
        isSuccess = res.status;
        devlog("SUCCESS MESSAGE - PROVIDER -> adminLogin : ${res.message}");
      } else {
        showSnackbarError("No Internet Connection");

        /// OR YOU CAN PERFORM OFFLINE ACTION SUCH AS OFFLINE DATA BASE
      }
    } on ServerException catch (e) {
      devlogError("ERROR - PROVIDER - SERVERE_EXCEPTION -> adminLogin: $e");
      showSnackbar(e.message);
    } catch (e) {
      devlogError("ERROR - PROVIDER - CATCH_ERROR -> adminLogin: $e");
      showSnackbar("Something went wrong.!");
    } finally {
      if (listen) notifyListeners();
    }
    return isSuccess;
  }
}
