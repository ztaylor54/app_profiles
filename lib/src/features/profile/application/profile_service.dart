import 'package:app_profiles/src/features/action/application/action_service.dart';
import 'package:app_profiles/src/features/action/models/action.dart';
import 'package:app_profiles/src/features/profile/data/profile_repository.dart';
import 'package:app_profiles/src/features/profile/models/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The profile service.
class ProfileService {
  ProfileService({
    required this.profileRepository,
    required this.actionService,
  });

  final ProfileRepository profileRepository;
  final ActionService actionService;

  /// Get a [Profile] by ID.
  Future<Profile> getProfile(ProfileId profileId) => throw UnimplementedError();

  /// Save a [Profile].
  Future<void> saveProfile(Profile profile) => throw UnimplementedError();

  /// Delete a [Profile] by ID.
  Future<void> deleteProfile(ProfileId profileId) => throw UnimplementedError();

  /// Get the list of [Action] for a given [ProfileId].
  Future<List<ActionId>> getActions(ProfileId profileId) => throw UnimplementedError();
  
  /// Add an [Action] to a [Profile] by [ProfileId].
  Future<void> addAction(ProfileId profileId, Action action) => throw UnimplementedError();

  /// Delete an [Action] from a [Profile] by ID.
  Future<void> deleteAction(ProfileId profileId, ActionId actionId) => throw UnimplementedError();

  /// Update an [Action] for a [Profile].
  Future<void> updateAction(ProfileId profileId, Action action) => throw UnimplementedError();

  /// Run every [Action] in a [Profile].
  Future<void> runActions(ProfileId profileId) => throw UnimplementedError();
}

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService(
    profileRepository: ref.watch(profileRepositoryProvider),
    actionService: ref.watch(actionServiceProvider),
  );
});