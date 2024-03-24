import 'package:app_profiles/src/features/profile/application/profile_service.dart';
import 'package:app_profiles/src/features/profile/models/profile/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppScaffoldController extends StateNotifier<AsyncValue<List<Profile>?>> {
  AppScaffoldController({
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

final appScaffoldControllerProvider =
    StateNotifierProvider.autoDispose<AppScaffoldController, AsyncValue<List<Profile>?>>(
        (ref) {
  return AppScaffoldController(
    profileService: ref.watch(profileServiceProvider),
  );
});