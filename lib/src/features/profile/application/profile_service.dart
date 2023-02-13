import 'package:app_profiles/src/features/action/application/action_service.dart';
import 'package:app_profiles/src/features/action/models/action/action.dart';
import 'package:app_profiles/src/features/profile/data/profile_repository.dart';
import 'package:app_profiles/src/features/profile/models/profile/profile.dart';
import 'package:app_profiles/src/features/profile/models/profile_error/profile_error.dart';
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
  Future<Profile> getProfile(ProfileId profileId) async =>
      profileRepository.getProfile(profileId);

  /// Save a [Profile].
  Future<void> saveProfile(Profile profile) async =>
      profileRepository.saveProfile(profile);

  /// Delete a [Profile] by ID.
  Future<void> deleteProfile(ProfileId profileId) async =>
      profileRepository.deleteProfile(profileId);

  /// Get the list of [ActionId] for a given [ProfileId].
  Future<List<ActionId>> getActions(ProfileId profileId) async =>
      profileRepository.getProfile(profileId).then(
            (profile) => profile.actions,
          );

  /// Save an [Action] to a [Profile] by [ProfileId].
  Future<void> saveAction(ProfileId profileId, Action action) async {
    await actionService.saveAction(action);
    final profile = await profileRepository.getProfile(profileId);
    final actions = profile.actions..add(action.id);
    return profileRepository.saveProfile(profile.copyWith(actions: actions));
  }

  /// Delete an [Action] from a [Profile] by ID.
  Future<void> deleteAction(ProfileId profileId, ActionId actionId) async {
    final profile = await profileRepository.getProfile(profileId);
    if (!profile.actions.contains(actionId)) {
      throw const ProfileError.invalidActionId();
    }
    await actionService.deleteAction(actionId);
  }

  /// Run every [Action] in a [Profile].
  Future<void> runActions(ProfileId profileId) async {
    final profile = await profileRepository.getProfile(profileId);
    for (final actionId in profile.actions) {
      actionService.runAction(actionId);
    }
  }
}

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService(
    profileRepository: ref.watch(profileRepositoryProvider),
    actionService: ref.watch(actionServiceProvider),
  );
});
