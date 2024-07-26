
import 'package:clean_arch_demo/config/data/dio/dio_client.dart';
import 'package:clean_arch_demo/core/data/repos/home_repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioClient _dioClient;

  HomeRepoImpl({required DioClient dioClient}) : _dioClient = dioClient;


}