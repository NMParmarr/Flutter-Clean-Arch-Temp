import 'package:clean_arch_demo/config/data/dio/content_types.dart';
import 'package:clean_arch_demo/config/data/dio/dio_client.dart';
import 'package:clean_arch_demo/core/data/models/requests/auth_reqs/login_req.dart';
import 'package:clean_arch_demo/core/data/models/response/login_response.dart';
import 'package:clean_arch_demo/core/data/repos/auth_repos/auth_repo.dart';

import '../../../../config/error/exceptions.dart';
import '../../../constants/api_constants.dart';

class AuthRepoImpl implements AuthRepo {
  final DioClient _dioClient;

  AuthRepoImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<LoginResponse> adminLogin(LoginReq req) async {
    try {
      /// CHANGE toJson TO toFormData WHERE YOU PASS IMAGE OF FILE (AS MULTIPART FILE)
      /// FOR THAT YOU HAVE TO CREATE toFormData() METHOD IN YOUR REQUEST CLASS
      /// toFormData() METHOD CONVERT NORMAL FILE IMAGE TO MULTIPART FILE
      /// HERE IS DEMO :
      /// --> final res = await _dioClient.post(Apis.adminLogin, data: req.toFormData(), contentType: CType.formData);
      ///
      final res = await _dioClient.post(Apis.adminLogin, data: req.toJson(), contentType: CType.json);
      /// CHANGE RESPONSE MODEL ACCOURDING YOUR RESPONSE
      final modelRes = LoginResponse.fromJson(res.data ?? {});
      return modelRes;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("Something went wrong.!");
    }
  }
}
