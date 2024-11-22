import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_details_state.dart';
part 'player_details_cubit.freezed.dart';

class PlayerDetailsCubit extends Cubit<PlayerDetailsState> {
  PlayerDetailsCubit() : super(const PlayerDetailsState.initial());

  String formatDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0'); // Ensure two digits
    final month =
        dateTime.month.toString().padLeft(2, '0'); // Ensure two digits
    final year = dateTime.year.toString();
    return '$day-$month-$year';
  }
}
