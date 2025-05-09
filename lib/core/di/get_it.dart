import 'package:chronicle/core/api/api_client.dart';
import 'package:chronicle/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:chronicle/feature/auth/data/repository/auth_repository_imp1.dart';
import 'package:chronicle/feature/auth/domain/repository/auth_repository.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

final  GetIt getIt = GetIt.instance;

void setup(){
registerApiClient();
registerDataSource();
rergisterRepository();
registerBloc();
}

void registerApiClient(){
getIt.registerSingleton(ApiClient());

}
void registerDataSource(){
var dio = getIt<ApiClient>().getDio();
getIt.registerSingleton(AuthRemoteDatasource(dio: dio));
}

void rergisterRepository(){
getIt.registerSingleton<AuthRepository>(AuthRepositoryImp1(authRemoteDatasource: getIt()));
}

void registerBloc(){
getIt.registerFactory(()=>UserBloc(authRepository: getIt()));
}