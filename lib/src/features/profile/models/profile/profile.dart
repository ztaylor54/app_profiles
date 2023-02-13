import 'package:app_profiles/src/features/action/models/action/action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

/// The ID of a [Profile].
typedef ProfileId = String;

@freezed
class Profile with _$Profile {
  const factory Profile({
    required ProfileId id,
    required String name,
    required String description,
    required List<ActionId> actions,
    required bool isActive,
    /// TODO: image, timer
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json)
      => _$ProfileFromJson(json);
}