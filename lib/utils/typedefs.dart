import 'dart:async';

typedef DisposeProvider<T> = FutureOr<void> Function(T value);
typedef EventCallBack = void Function(String? url, String? name);
