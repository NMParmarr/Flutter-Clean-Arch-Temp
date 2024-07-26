import '../../models/requests/auth_reqs/login_req.dart';
import '../../models/response/login_response.dart';

abstract interface class AuthRepo {
  Future<LoginResponse> adminLogin(LoginReq _);
}