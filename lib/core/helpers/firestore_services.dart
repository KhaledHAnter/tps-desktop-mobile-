import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';
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
        'age': player.age,
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

  /// Add a freeze to the player's freeze list
  Future<void> addPlayerFreeze(String documentId, FreezeModel newFreeze) async {
    try {
      final playerRef = _firestore.collection('players').doc(documentId);
      final snapshot = await playerRef.get();

      if (!snapshot.exists) {
        throw Exception('Player not found');
      }

      final currentData = snapshot.data()!;
      List<dynamic>? freezeList = currentData['freeze'];

      // Initialize freeze list if null
      freezeList ??= [];

      // Add the new freeze to the list
      freezeList.add({
        'freezeDays': newFreeze.freezeDays,
        'freezeReason': newFreeze.freezeReason,
      });

      // Update subsDuration and endDate
      final subsDuration =
          (currentData['subsDuration'] as int) + newFreeze.freezeDays;
      final startDate = DateTime.parse(currentData['startDate']);
      final newEndDate = startDate.add(Duration(days: subsDuration));

      // Update Firestore document
      await playerRef.update({
        'freeze': freezeList,
        'subsDuration': subsDuration,
        'endDate': newEndDate.toIso8601String(),
      });
    } catch (e) {
      print('Error adding player freeze: $e');
      throw Exception('Failed to add freeze');
    }
  }

  // Delete a specific freeze from the player's freeze list
  Future<void> deletePlayerFreeze(
      String documentId, int freezeIndex, FreezeModel freeze) async {
    try {
      final playerRef = _firestore.collection('players').doc(documentId);
      final snapshot = await playerRef.get();

      if (!snapshot.exists) {
        throw Exception('Player not found');
      }

      final currentData = snapshot.data()!;
      List<dynamic>? freezeList = currentData['freeze'];

      if (freezeList == null || freezeList.isEmpty) {
        throw Exception('No freezes found for the player');
      }

      // Remove the specific freeze by index
      freezeList.removeAt(freezeIndex);

      final subsDuration =
          (currentData['subsDuration'] as int) - freeze.freezeDays;
      final startDate = DateTime.parse(currentData['startDate']);
      final newEndDate = startDate.add(Duration(days: subsDuration));

      // Update the Firestore document
      await playerRef.update({
        'freeze': freezeList,
        'subsDuration': subsDuration,
        'endDate': newEndDate.toIso8601String(),
      });
    } catch (e) {
      print('Error deleting player freeze: $e');
      throw Exception('Failed to delete freeze');
    }
  }
}
