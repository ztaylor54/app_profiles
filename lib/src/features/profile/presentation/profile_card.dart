import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageURL;
  final int numActions;

  const ProfileCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageURL,
    required this.numActions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.image),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(title),
                                subtitle: Text(subtitle),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  numActions > 0
                      ? Text("${numActions.toString()} actions")
                      : const Text("No actions"),
                  const Spacer(),
                ],
              ),
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  // Handle "See Details" button press
                },
                child: const Text("See Details"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle "Quick Launch" button press
                },
                child: const Text("Quick Launch"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
