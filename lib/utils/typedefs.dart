import 'dart:async';

typedef DisposeProvider<T> = FutureOr<void> Function(T value);
