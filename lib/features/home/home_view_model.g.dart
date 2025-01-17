// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$isRejectUnknownCallersEnabledAtom = Atom(
      name: 'HomeViewModelBase.isRejectUnknownCallersEnabled',
      context: context);

  @override
  bool get isRejectUnknownCallersEnabled {
    _$isRejectUnknownCallersEnabledAtom.reportRead();
    return super.isRejectUnknownCallersEnabled;
  }

  @override
  set isRejectUnknownCallersEnabled(bool value) {
    _$isRejectUnknownCallersEnabledAtom
        .reportWrite(value, super.isRejectUnknownCallersEnabled, () {
      super.isRejectUnknownCallersEnabled = value;
    });
  }

  late final _$setRejectUnknownCallersEnabledAsyncAction = AsyncAction(
      'HomeViewModelBase.setRejectUnknownCallersEnabled',
      context: context);

  @override
  Future<void> setRejectUnknownCallersEnabled(bool value) {
    return _$setRejectUnknownCallersEnabledAsyncAction
        .run(() => super.setRejectUnknownCallersEnabled(value));
  }

  late final _$fetchPreferencesAsyncAction =
      AsyncAction('HomeViewModelBase.fetchPreferences', context: context);

  @override
  Future<void> fetchPreferences() {
    return _$fetchPreferencesAsyncAction.run(() => super.fetchPreferences());
  }

  @override
  String toString() {
    return '''
isRejectUnknownCallersEnabled: ${isRejectUnknownCallersEnabled}
    ''';
  }
}
