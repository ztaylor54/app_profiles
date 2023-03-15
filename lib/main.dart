import 'package:app_profiles/src/features/action/models/action/action.dart'
    as MyAction;
import 'package:app_profiles/src/features/profile/application/profile_service.dart';
import 'package:app_profiles/src/features/profile/models/profile/profile.dart';
import 'package:app_profiles/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final profileService = ref.watch(profileServiceProvider);

    // add a test profile
    profileService.saveProfile(
      const Profile(
          id: 'profile1',
          name: 'Test Profile 1',
          description: 'A really nice description',
          actions: [],
          isActive: false),
    );
    profileService.saveProfile(
      const Profile(
          id: 'profile2',
          name: 'Test Profile 2',
          description: 'A really nice description',
          actions: [],
          isActive: false),
    );
    profileService.saveProfile(
      const Profile(
          id: 'profile3',
          name: 'Test Profile 3',
          description: 'A really nice description',
          actions: [],
          isActive: false),
    );
    profileService.saveAction(
      'profile1',
      const MyAction.Action(
        id: 'action1',
        name: 'Test Action',
        description: 'Test action description',
        command: 'open -a \'Google Chrome\' http://github.com',
      ),
    );

    return MaterialApp.router(
      routerConfig: appRouter.appRoutes,
      title: 'App Profiles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
