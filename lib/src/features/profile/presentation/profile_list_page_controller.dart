import 'package:app_profiles/src/features/profile/application/profile_service.dart';
import 'package:app_profiles/src/features/profile/models/profile/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePageController extends StateNotifier<AsyncValue<List<Profile>?>> {
  ProfilePageController({
    required this.profileService,
  }) : super(const AsyncData(null)) {
    fetchProfiles(); // start fetching when the controller is created
  }

  final ProfileService profileService;

  /// Fetch the currently signed-in user's [Profile]s.
  Future<void> fetchProfiles() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(profileService.getProfiles);
  }
}

final profileListPageControllerProvider =
    StateNotifierProvider.autoDispose<ProfilePageController, AsyncValue<List<Profile>?>>(
        (ref) {
  return ProfilePageController(
    profileService: ref.watch(profileServiceProvider),
  );
});