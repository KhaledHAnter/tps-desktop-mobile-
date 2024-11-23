import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/home/data/models/player_model.dart';

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

  /// Fetches a player by document ID
  Future<Map<String, dynamic>?> fetchPlayerById(String documentId) async {
    try {
      final doc = await _firestore.collection('players').doc(documentId).get();
      if (doc.exists) {
        return doc.data();
      } else {
        print('Player not found for ID: $documentId');
        return null;
      }
    } catch (e) {
      print('Error fetching player: $e');
      return null;
    }
  }

  /// Delete a player document by its ID (phone)
  Future<void> deletePlayer(String documentId) async {
    try {
      await _firestore.collection('players').doc(documentId).delete();
    } catch (e) {
      print('Error deleting player: $e');
      throw Exception('Failed to delete player');
    }
  }
}
