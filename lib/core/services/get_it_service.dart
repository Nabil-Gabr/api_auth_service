

import 'package:get_it/get_it.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/services/api_auth_service.dart';
import 'package:happy_tech_mastering_api_with_flutter/data/repo_impl/auth_repo_impl.dart';
import 'package:happy_tech_mastering_api_with_flutter/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiAuthService>(ApiAuthService());

  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(apiAuthService: getIt<ApiAuthService>()));
}