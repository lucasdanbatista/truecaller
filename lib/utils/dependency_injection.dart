import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:truecaller/utils/dependency_injection.config.dart';

final get = GetIt.instance;

@injectableInit
void initDependencies() {
  get.init();
}
