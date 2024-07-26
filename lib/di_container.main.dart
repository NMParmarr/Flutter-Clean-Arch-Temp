part of 'di_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// CORE
  ///
  final sharedPreferences = await SharedPreferences.getInstance();
  sl
    ..registerLazySingleton<Dio>(() => Dio())
    ..registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor())
    ..registerLazySingleton<DioClient>(() => DioClient(Apis.url, dio: sl(), loggingInterceptor: sl(), sharedPreferences: sl()))
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)
    ..registerLazySingleton<NetworkService>(() => NetworkService()..startConnectionStreaming()); // DONT FORGET TO ADD SEMICOLUN AT THE LAST LINE
  // ..registerLazySingleton<FirebaseClient>(() => FirebaseClient())
  // ..registerLazySingleton<HiveClient>(() => HiveClient()..initHive());

  /// REPOS
  ///
  sl
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(dioClient: sl()))
    ..registerLazySingleton<HomeRepo>(() => HomeRepoImpl(dioClient: sl())); // DONT FORGET TO ADD SEMICOLUN AT THE LAST LINE

  /// PROVIDERS
  ///
  sl
    ..registerFactory<SplashProvider>(() => SplashProvider(sp: sl()))
    ..registerFactory<AuthProvider>(() => AuthProvider(authRepo: sl(), sp: sl(), networkService: sl()))
    ..registerFactory<HomeProvider>(() => HomeProvider(sp: sl(), networkService: sl()))
    ..registerFactory<DemoProvider>(() => DemoProvider(authRepo: sl(), sp: sl(), networkService: sl())); // DONT FORGET TO ADD SEMICOLUN AT THE LAST LINE

  /// EXTERNAL
  ///
  // Hive.init((await getApplicationDocumentsDirectory()).path);
}
