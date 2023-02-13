import 'package:app_profiles/src/features/action/models/action.dart';
import 'package:app_profiles/src/features/action/data/action_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The action service.
class ActionService {
  ActionService({
    required this.actionRepository,
  });

  final ActionRepository actionRepository;
  
  /// Get an [Action] by ID.
  Future<Action> getAction(ActionId actionId) => throw UnimplementedError();

  /// Save an [Action].
  Future<void> saveAction(Action action) => throw UnimplementedError();

  /// Delete an [Action] by ID.
  Future<void> deleteAction(ActionId actionId) => throw UnimplementedError();

  /// Run an [Action] by ID.
  Future<void> runAction(ActionId actionId) => throw UnimplementedError();
}

final actionServiceProvider = Provider<ActionService>((ref) {
  return ActionService(
    actionRepository: ref.watch(actionRepositoryProvider),
  );
});