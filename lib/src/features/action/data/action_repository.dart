import 'package:app_profiles/src/features/action/models/action.dart';
import 'package:app_profiles/src/util/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Action repository.
class ActionRepository {
  final _actions = InMemoryStore<Map<ActionId, Action>>({});

  /// Get an [Action] by ID.
  Future<Action> getAction(ActionId actionId) => throw UnimplementedError();

  /// Save an [Action].
  Future<void> saveAction(Action profile) => throw UnimplementedError();

  /// Delete an [Action] by ID.
  Future<void> deleteAction(ActionId actionId) => throw UnimplementedError();
}

/// [ActionRepository] provider.
final actionRepositoryProvider = Provider<ActionRepository>((ref) {
  return ActionRepository();
});