import 'package:app_profiles/src/features/profile/models/profile.dart';
import 'package:app_profiles/src/util/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Profile repository.
class ProfileRepository {
  final _profiles = InMemoryStore<Map<ProfileId, Profile>>({});

  /// Get a [Profile] by id.
  Future<Profile> getProfile(ProfileId profileId) => throw UnimplementedError();

  /// Save a [Profile].
  Future<void> saveProfile(Profile profile) => throw UnimplementedError();

  /// Delete a [Profile].
  Future<void> deleteProfile(ProfileId profileId) => throw UnimplementedError();
}

/// [ProfileRepository] provider.
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});