import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/home/data/models/profile_model.dart';
import 'package:tps/features/local_auth/data/repos/auth_repo.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit(this.repo) : super(const AuthState.initial());

  Future<void> fetchallProfileData() async {
    emit(const AuthState.authLoading());
    try {
      final profile = await repo.fetchallProfileData();
      emit(AuthState.authsuccess(profile!));
    } catch (e) {
      emit(AuthState.autherror(e.toString()));
    }
  }
}
