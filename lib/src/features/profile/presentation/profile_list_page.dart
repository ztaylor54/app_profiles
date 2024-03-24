import 'package:app_profiles/src/common_widgets/app_scaffold.dart';
import 'package:app_profiles/src/features/profile/presentation/profile_card.dart';
import 'package:app_profiles/src/features/profile/presentation/profile_list_page_controller.dart';
import 'package:app_profiles/src/routing/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileListPage extends ConsumerWidget {
  const ProfileListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileListPageControllerProvider);

    return ScaffoldWithDrawerNav(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 12,
              child: Column(
                children: [
                  // top row with list header & 'add profile' button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'My Profiles',
                        style: TextStyle(color: Colors.blueGrey.shade400),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Add a profile'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  state.when(
                    data: (profileList) {
                      if (profileList == null || profileList.isEmpty) {
                        return const Text(
                            "No profiles to display. Click \"Add a profile\" to get started!");
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: profileList.length,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                        ),
                        itemBuilder: ((context, index) {
                          return ProfileCard(
                            title: profileList[index].name,
                            subtitle: profileList[index].description,
                            numActions: profileList[index].actions.length,
                            imageURL: "test",
                            onSeeDetails: () => context.pushNamed(
                              AppPage.profileDetail.name,
                              params: {'profileId': profileList[index].id},
                            ),
                          );
                        }),
                      );
                    },
                    error: (error, stackTrace) {
                      return Text(
                          "Error while fetching profiles: ${error.toString()}");
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
