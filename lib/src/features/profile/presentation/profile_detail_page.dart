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
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              // top row with right-alighned 'add profile' button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add a profile'),
                  ),
                ],
              ),
              // next row with list header & search bar
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Profiles'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('<Search TODO>'),
                  )
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
