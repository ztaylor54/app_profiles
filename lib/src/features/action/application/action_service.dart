import 'package:app_profiles/src/features/action/data/action_repository.dart';
import 'package:app_profiles/src/features/action/models/action/action.dart';
import 'package:process_run/shell.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'action_service.g.dart';

/// The action service.
class ActionService {
  ActionService({
    required this.actionRepository,
  });

  final _shell = Shell();

  final ActionRepository actionRepository;

  /// Get an [Action] by ID.
  Future<Action> getAction(ActionId actionId) =>
      actionRepository.getAction(actionId);

  /// Save an [Action].
  Future<void> saveAction(Action action) => actionRepository.saveAction(action);

  /// Delete an [Action] by ID.
  Future<void> deleteAction(ActionId actionId) =>
      actionRepository.deleteAction(actionId);

  /// Run an [Action] by ID.
  Future<void> runAction(ActionId actionId) async =>
      actionRepository.getAction(actionId).then(
            (action) => _shell.run(action.command),
          );
}

/// [ActionService] provider.
@riverpod
ActionService actionService(ActionServiceRef ref) {
  return ActionService(
    actionRepository: ref.watch(actionRepositoryProvider),
  );
}
