// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_google_command.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginWithGoogleCommand)
final loginWithGoogleCommandProvider = LoginWithGoogleCommandProvider._();

final class LoginWithGoogleCommandProvider
    extends $NotifierProvider<LoginWithGoogleCommand, AsyncValue<void>> {
  LoginWithGoogleCommandProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginWithGoogleCommandProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginWithGoogleCommandHash();

  @$internal
  @override
  LoginWithGoogleCommand create() => LoginWithGoogleCommand();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$loginWithGoogleCommandHash() =>
    r'6beaa51b8d3b097d1350d8ccba4f34af2cce024b';

abstract class _$LoginWithGoogleCommand extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
