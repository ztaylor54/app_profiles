import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_error.freezed.dart';

@freezed
class ProfileError with _$ProfileError {
  const ProfileError._();

  const factory ProfileError.noProfileWithGivenId() = _NoProfileWithGivenId;
  const factory ProfileError.invalidActionId() = _InvalidActionId;
  const factory ProfileError.unknown() = _Unknown;

  @override
  String toString() => when(
    noProfileWithGivenId: () => 'No profile exists with the provided ID',
    invalidActionId: () => 'Profile does not contain an action with the given ID',
    unknown: () => 'An unknown error occurred',
  );
}

extension ProfileErrorAsync on ProfileError {
  AsyncValue<T> asAsyncValue<T>() =>  AsyncValue.error(toString(), StackTrace.current);
}