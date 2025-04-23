import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/core/helpers/cach_time.dart';
import 'package:url_launcher/url_launcher.dart';

part 'player_details_cubit.freezed.dart';
part 'player_details_state.dart';

class PlayerDetailsCubit extends Cubit<PlayerDetailsState> {
  PlayerDetailsCubit() : super(const PlayerDetailsState.initial());

  String formatDateTime(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    return '$day-$month-$year';
  }

  Future<void> sendMessageOnWhatsApp(String phoneNumber, String message) async {
    await saveChatTimestamp(phoneNumber);
    final Uri whatsappUrl = Uri.parse(
        'https://wa.me/+$phoneNumber?text=${Uri.encodeComponent(message)}');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}
