// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i790;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:truecaller/features/home/home_view_model.dart' as _i643;
import 'package:truecaller/features/phone_list/phone_list_view_model.dart'
    as _i952;
import 'package:truecaller/repositories/preferences_repository.dart' as _i432;
import 'package:truecaller/utils/app_router.dart' as _i39;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i432.PreferencesRepository>(
        () => _i432.DefaultPreferencesRepository());
    gh.lazySingleton<_i790.RootStackRouter>(() => _i39.AppRoute());
    gh.lazySingleton<_i643.HomeViewModel>(
        () => _i643.HomeViewModel(gh<_i432.PreferencesRepository>()));
    gh.factory<_i952.PhoneListViewModel>(
        () => _i952.PhoneListViewModel(gh<_i432.PreferencesRepository>()));
    return this;
  }
}
