import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truecaller/entities/phone_list_mode.dart';

abstract interface class PreferencesRepository {
  Future<void> fetchAll();

  bool get isInitialized;

  bool get isRejectUnknownCallersEnabled;

  Future<void> setInitialized(bool value);

  Future<void> setRejectUnknownCallersEnabled(bool value);

  Future<List<String>> getPhones(PhoneListMode mode);

  Future<void> addPhone(PhoneListMode mode, String phone);

  Future<void> deletePhone(PhoneListMode mode, String phone);
}

@LazySingleton(as: PreferencesRepository)
class DefaultPreferencesRepository implements PreferencesRepository {
  late SharedPreferences _prefs;
  static const _initializedKey = 'initialized';
  static const _rejectUnknownCallers = 'reject_unknown_callers';

  @override
  Future<void> fetchAll() async =>
      _prefs = await SharedPreferences.getInstance();

  @override
  bool get isInitialized => _prefs.getBool(_initializedKey) ?? false;

  @override
  bool get isRejectUnknownCallersEnabled =>
      _prefs.getBool(_rejectUnknownCallers) ?? false;

  @override
  Future<void> setInitialized(bool value) =>
      _prefs.setBool(_initializedKey, value);

  @override
  Future<void> setRejectUnknownCallersEnabled(bool value) =>
      _prefs.setBool(_rejectUnknownCallers, value);

  @override
  Future<List<String>> getPhones(PhoneListMode mode) async =>
      _prefs.getStringList(mode.name) ?? <String>[];

  @override
  Future<void> addPhone(PhoneListMode mode, String phone) async {
    final phones = await getPhones(mode);
    phones.add(phone);
    await _prefs.setStringList(mode.name, phones);
  }

  @override
  Future<void> deletePhone(PhoneListMode mode, String phone) async {
    final phones = await getPhones(mode);
    phones.remove(phone);
    await _prefs.setStringList(mode.name, phones);
  }
}
