import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';
import 'package:tps/features/home/data/models/profile_model.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';

import '../../features/home/data/models/player_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetches exercises for a player from Firestore
  Future<ProfileModel?> fetchProfileData(String phone) async {
    try {
      // Reference to the Firestore collection
      final docSnapshot = await FirebaseFirestore.instance
          .collection('profile') // Name of the collection
          .doc(phone) // Document ID to fetch
          .get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Convert Firestore data to ProfileModel
        return ProfileModel.fromMap(docSnapshot.data()!);
      } else {
        print("Document with ID $phone does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching profile: $e");
      return null;
    }
  }

  Future<List<ProfileModel>?> fetchallProfileData() async {
    try {
      // Reference to the Firestore collection
      final docSnapshot = await FirebaseFirestore.instance
          .collection('profile') // Name of the collection

          .get();

      // Check if the document exists
      if (docSnapshot.docs.isNotEmpty) {
        // Convert Firestore data to ProfileModel
        final profilesData = docSnapshot.docs
            .map(
              (doc) => ProfileModel.fromMap(
                doc.data(),
              ),
            )
            .toList();
        log(profilesData.toString());
        return profilesData;
      } else {
        log("no data");
        return null;
      }
    } catch (e) {
      log("Error fetching profile: $e");
      return null;
    }
  }

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

  /// Saves an exercise to Firestore
  Future<void> addExerciseToFirestore(
      ExerciseModel exercise, String phone) async {
    try {
      final exerciseRef =
          FirebaseFirestore.instance.collection('exercises').doc(phone);

      // Add or update the exercise for the player (overwrites if the document already exists)
      await exerciseRef.set({
        'exercises': FieldValue.arrayUnion([exercise.toMap()]),
      }, SetOptions(merge: true));

      print('Exercise added successfully!');
    } catch (e) {
      print('Error adding exercise: $e');
      rethrow;
    }
  }

  /// Fetches exercises for a player from Firestore
  Future<List<ExerciseModel>> fetchExercisesFromFirestore(String phone) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('exercises')
          .doc(phone)
          .get();

      if (docSnapshot.exists) {
        // Get the exercises from the document's 'exercises' field
        final exercisesData = docSnapshot.data()?['exercises'] as List<dynamic>;

        return exercisesData
            .map((exerciseData) => ExerciseModel.fromMap(exerciseData))
            .toList();
      } else {
        print('No exercises found for player $phone.');
        return [];
      }
    } catch (e) {
      print('Error fetching exercises: $e');
      rethrow;
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

  Future<void> deleteExerciseFromFirestore(
      String phone, String exerciseName) async {
    try {
      final exerciseRef =
          FirebaseFirestore.instance.collection('exercises').doc(phone);

      // Fetch the document to find the exercise
      final docSnapshot = await exerciseRef.get();

      if (docSnapshot.exists) {
        // Get the list of exercises
        final exercises = List.from(docSnapshot.data()?['exercises'] ?? []);

        // Find the exercise to remove
        final exerciseToDelete = exercises.firstWhere(
          (exercise) => exercise['name'] == exerciseName,
          orElse: () => null, // If no matching exercise is found, return null
        );

        if (exerciseToDelete != null) {
          // Use arrayRemove to delete the exact exercise object from the 'exercises' array
          await exerciseRef.update({
            'exercises': FieldValue.arrayRemove([exerciseToDelete]),
          });

          print('Exercise deleted successfully!');
        } else {
          print('Exercise with name "$exerciseName" not found!');
        }
      } else {
        print('Player document does not exist!');
      }
    } catch (e) {
      print('Error deleting exercise: $e');
      rethrow; // Propagate the error
    }
  }

  Future<void> addHistoryToExercise(
      String phone, String exerciseName, HistoryModel history) async {
    try {
      final exerciseRef =
          FirebaseFirestore.instance.collection('exercises').doc(phone);

      // Fetch the current exercise document
      final docSnapshot = await exerciseRef.get();

      if (docSnapshot.exists) {
        final exercises = List.from(docSnapshot.data()?['exercises'] ?? []);

        // Find the exercise to update
        final exerciseToUpdate = exercises.firstWhere(
          (exercise) => exercise['name'] == exerciseName,
          orElse: () => null,
        );

        if (exerciseToUpdate != null) {
          // Insert the new history entry at the top (index 0) of the history list
          final updatedHistory = List.from(exerciseToUpdate['history'])
            ..insert(0, history.toMap()); // Insert at the top (index 0)

          // Update the exercise with the new history list (without adding a new exercise)
          await exerciseRef.update({
            'exercises': exercises.map((exercise) {
              // If the exercise name matches, update its history field
              if (exercise['name'] == exerciseName) {
                return {
                  'name': exerciseName,
                  'history': updatedHistory,
                  'reps': exercise['reps'],
                  'sets': exercise['sets'],
                };
              }
              return exercise; // Otherwise, return the exercise as it is
            }).toList(),
          });

          print('History added to exercise successfully!');
        } else {
          print('Exercise not found!');
        }
      } else {
        print('No exercises found for the player.');
      }
    } catch (e) {
      print('Error adding history to exercise: $e');
      rethrow;
    }
  }

  // Method to delete history entry
  Future<void> deleteHistoryEntry(
      String phone, String exerciseName, int historyIndex) async {
    try {
      final exerciseRef = _firestore.collection('exercises').doc(phone);

      // Fetch the current exercise document
      final docSnapshot = await exerciseRef.get();

      if (docSnapshot.exists) {
        final exercises = List.from(docSnapshot.data()?['exercises'] ?? []);

        // Find the exercise to update
        final exerciseToUpdate = exercises.firstWhere(
          (exercise) => exercise['name'] == exerciseName,
          orElse: () => null,
        );

        if (exerciseToUpdate != null) {
          // Remove the history entry at the specified index
          final updatedHistory = List.from(exerciseToUpdate['history']);
          updatedHistory.removeAt(
              historyIndex); // Remove the entry at the specified index

          // Update the exercise with the modified history
          await exerciseRef.update({
            'exercises': exercises.map((exercise) {
              if (exercise['name'] == exerciseName) {
                return {
                  'name': exerciseName,
                  'history': updatedHistory,
                  'reps': exercise['reps'],
                  'sets': exercise['sets'],
                };
              }
              return exercise; // Otherwise, return the exercise as it is
            }).toList(),
          });

          print('History entry deleted successfully!');
        } else {
          print('Exercise not found!');
        }
      } else {
        print('No exercises found for the player.');
      }
    } catch (e) {
      print('Error deleting history entry: $e');
      rethrow;
    }
  }
}
