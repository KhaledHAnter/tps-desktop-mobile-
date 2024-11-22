import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Saves a player to Firestore with phone number as the document ID
  Future<bool> addPlayerToFirestore(PlayerModel player) async {
    try {
      await _firestore
          .collection('players')
          .doc(player.phone) // Use phone number as the document ID
          .set({
        'name': player.name,
        'sport': player.sport,
        'phase': player.phase,
        'phone': player.phone,
        'money': player.money,
        'subsDuration': player.subsDuration,
        'startDate': player.startDate.toIso8601String(),
        'endDate': player.endDate.toIso8601String(),
        'remainingDuration': player.remainingDuration,
        'description': player.description,
        'freeze': null,
      });
      print('Player added successfully!');
      return true;
    } catch (e) {
      print('Error adding player: $e');
      return false;
    }
  }

  /// Fetches all player documents from Firestore
  Future<List<Map<String, dynamic>>?> fetchPlayers() async {
    try {
      final snapshot = await _firestore
          .collection('players')
          .orderBy('startDate', descending: true)
          .get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching players: $e');
      return null;
    }
  }
}
