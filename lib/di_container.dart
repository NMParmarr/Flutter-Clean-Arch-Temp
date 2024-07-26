
import 'package:clean_arch_demo/core/data/repos/auth_repos/auth_repo.dart';
import 'package:clean_arch_demo/core/data/repos/auth_repos/auth_repo_impl.dart';
import 'package:clean_arch_demo/core/data/repos/home_repos/home_repo.dart';
import 'package:clean_arch_demo/core/data/repos/home_repos/home_repo_impl.dart';
import 'package:clean_arch_demo/src/auth/providers/auth_provider.dart';
import 'package:clean_arch_demo/src/demo/providers/demo_provider.dart';
import 'package:clean_arch_demo/src/home/providers/home_provider.dart';
import 'package:clean_arch_demo/src/splash/providers/splash_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/data/dio/dio_client.dart';
import 'config/data/dio/logging_intercepter.dart';
import 'core/constants/api_constants.dart';
import 'core/network/network_service.dart';
part 'di_container.main.dart';