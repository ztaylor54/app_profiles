import 'package:app_profiles/src/features/action/models/action/action.dart';
import 'package:app_profiles/src/features/action/models/action_error.dart';
import 'package:app_profiles/src/util/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Action repository.
class ActionRepository {
  final _actions = InMemoryStore<Map<ActionId, Action>>({});

  /// Get an [Action] by ID.
  Future<Action> getAction(ActionId actionId) async {
    try {
      return _actions.value[actionId]!;
    } catch (e) {
      throw const ActionError.noActionWithGivenId();
    }
  }

  /// Save an [Action].
  Future<void> saveAction(Action action) async =>
      _actions.value[action.id] = action;

  /// Delete an [Action] by ID.
  Future<void> deleteAction(ActionId actionId) async => _actions.value.remove(actionId);
}

/// [ActionRepository] provider.
final actionRepositoryProvider = Provider<ActionRepository>((ref) {
  return ActionRepository();
});
