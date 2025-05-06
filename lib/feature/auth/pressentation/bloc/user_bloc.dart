import 'package:chronicle/feature/auth/domain/repository/auth_repository.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_event.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent ,UserState> {
  final AuthRepository authRepository;
  UserBloc({required this.authRepository}) : super(UserState.initial()){
    on<LoginWithGoogleEvent>(onLoginWithGoogleEvent);
  }

  Future onLoginWithGoogleEvent(LoginWithGoogleEvent event ,Emitter emit)async{
    emit(state.copyWith(status: UserStatus.loading));
    var data = await authRepository.loginWithGoogle();
    if(data.isRight()){
      emit(state.copyWith(status: UserStatus.success, userModle: data.right));
    }else{
      emit(state.copyWith(status: UserStatus.error, errorMessage: data.left.message));
    }
  }
}