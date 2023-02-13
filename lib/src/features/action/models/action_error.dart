import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_error.freezed.dart';

@freezed
class ActionError with _$ActionError {
  const ActionError._();

  const factory ActionError.noActionWithGivenId() = _NoActionWithGivenId;
  const factory ActionError.unknown() = _Unknown;

  @override
  String toString() => when(
    noActionWithGivenId: () => 'No action exists with the provided ID',
    unknown: () => 'An unknown error occurred',
  );
}

extension ActionErrorAsync on ActionError {
  AsyncValue<T> asAsyncValue<T>() =>  AsyncValue.error(toString(), StackTrace.current);
}