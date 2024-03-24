import 'package:app_profiles/src/features/profile/presentation/profile_detail_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetailPage extends ConsumerStatefulWidget {
  const ProfileDetailPage({
    super.key,
    required this.profileId,
  });

  final String profileId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileDetailPageState();
}

class _ProfileDetailPageState extends ConsumerState<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileDetailPageControllerProvider);
    // update the profileId
    Future.microtask(
      () => ref
          .read(profileDetailPageControllerProvider.notifier)
          .fetchProfile(profileId: widget.profileId),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  state.when(
                    data: (profile) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.image),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(profile.name),
                                      subtitle: Text(profile.description),
                                      contentPadding: const EdgeInsets.all(0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              const Text("Actions"),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(profileDetailPageControllerProvider
                                          .notifier)
                                      .addTestActions(
                                          profileId: widget.profileId);
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Text(
                          "Error while fetching profile: ${error.toString()}");
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
