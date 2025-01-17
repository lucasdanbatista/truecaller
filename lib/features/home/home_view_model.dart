import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:telecom_manager/telecom_manager.dart';
import 'package:truecaller/repositories/preferences_repository.dart';

part 'home_view_model.g.dart';

@lazySingleton
class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store {
  final PreferencesRepository _preferencesRepository;

  HomeViewModelBase(this._preferencesRepository);

  @observable
  bool isRejectUnknownCallersEnabled = false;

  @action
  Future<void> setRejectUnknownCallersEnabled(bool value) async {
    await _preferencesRepository.setRejectUnknownCallersEnabled(value);
    isRejectUnknownCallersEnabled = value;
  }

  @action
  Future<void> fetchPreferences() async {
    await _preferencesRepository.fetchAll();
    if (!_preferencesRepository.isInitialized) {
      await _preferencesRepository.setInitialized(true);
      TelecomManager.enableWhitelist();
    }
    isRejectUnknownCallersEnabled =
        _preferencesRepository.isRejectUnknownCallersEnabled;
  }
}
