part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authLoading() = AuthLoading;
  const factory AuthState.authsuccess(ProfileModel profile) = AuthSuccess;
  const factory AuthState.autherror(String message) = AuthError;
}
