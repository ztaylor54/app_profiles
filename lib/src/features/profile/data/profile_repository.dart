import 'package:app_profiles/src/features/profile/models/profile/profile.dart';
import 'package:app_profiles/src/features/profile/models/profile_error/profile_error.dart';
import 'package:app_profiles/src/util/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

/// Profile repository.
class ProfileRepository {
  final _profiles = InMemoryStore<Map<ProfileId, Profile>>({});

  /// Get a [Profile] by id.
  Future<Profile> getProfile(ProfileId profileId) async {
    try {
      return _profiles.value[profileId]!;
    } catch (e) {
      throw const ProfileError.noProfileWithGivenId();
    }
  }

  /// Get the list of [Profile].
  Future<List<Profile>> getProfiles() async {
    return _profiles.value.values.toList();
  }

  /// Save a [Profile].
  Future<void> saveProfile(Profile profile) async => _profiles.value.update(
        profile.id,
        (_) => profile,
        ifAbsent: () => profile,
      );

  /// Delete a [Profile].
  Future<void> deleteProfile(ProfileId profileId) async =>
      _profiles.value.remove(profileId);
}

/// [ProfileRepository] provider.
@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepository();
}
