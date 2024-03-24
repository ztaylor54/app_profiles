import 'dart:developer';

import 'package:app_profiles/src/features/action/models/action/action.dart'
    as my_action;
import 'package:app_profiles/src/features/profile/application/profile_service.dart';
import 'package:app_profiles/src/features/profile/models/profile/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetailPageController extends StateNotifier<AsyncValue<Profile>> {
  ProfileDetailPageController({
    required this.profileService,
  }) : super(const AsyncLoading());

  final ProfileService profileService;

  /// Fetch the currently signed-in user's [Profile]s.
  Future<void> fetchProfile({required String profileId}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => profileService.getProfile(profileId));
  }

  Future<void> addTestActions({required String profileId}) async {
    log("here");
    await profileService.saveAction(
      profileId,
      const my_action.Action(
        id: 'action1',
        name: 'Test Action',
        description: 'Test action description',
        command: 'open -a \'Google Chrome\' http://github.com',
      ),
    );
  }
}

final profileDetailPageControllerProvider = StateNotifierProvider.autoDispose<
    ProfileDetailPageController, AsyncValue<Profile>>((ref) {
  return ProfileDetailPageController(
    profileService: ref.watch(profileServiceProvider),
  );
});
