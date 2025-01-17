import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:truecaller/entities/phone_list_mode.dart';
import 'package:truecaller/repositories/preferences_repository.dart';

part 'phone_list_view_model.g.dart';

@injectable
class PhoneListViewModel = PhoneListViewModelBase with _$PhoneListViewModel;

abstract class PhoneListViewModelBase with Store {
  final PreferencesRepository _preferencesRepository;

  PhoneListViewModelBase(this._preferencesRepository);

  @observable
  ObservableList<String> phones = ObservableList();

  @action
  Future<void> add(PhoneListMode mode, String phone) async {
    await _preferencesRepository.addPhone(mode, phone);
    await fetch(mode);
  }

  @action
  Future<void> remove(PhoneListMode mode, String phone) async {
    await _preferencesRepository.deletePhone(mode, phone);
    await fetch(mode);
  }

  @action
  Future<void> fetch(PhoneListMode mode) async => phones = ObservableList.of(
        await _preferencesRepository.getPhones(mode),
      );
}
