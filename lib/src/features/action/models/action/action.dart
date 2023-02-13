import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'action.freezed.dart';
part 'action.g.dart';

/// The ID of an [Action].
typedef ActionId = String;

@freezed
class Action with _$Action {
  const factory Action({
    required ActionId id,
    required String name,
    required String description,
    required String command,
    /// TODO: icon
  }) = _Action;

  factory Action.fromJson(Map<String, Object?> json)
      => _$ActionFromJson(json);
}