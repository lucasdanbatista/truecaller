// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhoneListViewModel on PhoneListViewModelBase, Store {
  late final _$phonesAtom =
      Atom(name: 'PhoneListViewModelBase.phones', context: context);

  @override
  ObservableList<String> get phones {
    _$phonesAtom.reportRead();
    return super.phones;
  }

  @override
  set phones(ObservableList<String> value) {
    _$phonesAtom.reportWrite(value, super.phones, () {
      super.phones = value;
    });
  }

  late final _$addAsyncAction =
      AsyncAction('PhoneListViewModelBase.add', context: context);

  @override
  Future<void> add(PhoneListMode mode, String phone) {
    return _$addAsyncAction.run(() => super.add(mode, phone));
  }

  late final _$removeAsyncAction =
      AsyncAction('PhoneListViewModelBase.remove', context: context);

  @override
  Future<void> remove(PhoneListMode mode, String phone) {
    return _$removeAsyncAction.run(() => super.remove(mode, phone));
  }

  late final _$fetchAsyncAction =
      AsyncAction('PhoneListViewModelBase.fetch', context: context);

  @override
  Future<void> fetch(PhoneListMode mode) {
    return _$fetchAsyncAction.run(() => super.fetch(mode));
  }

  @override
  String toString() {
    return '''
phones: ${phones}
    ''';
  }
}
