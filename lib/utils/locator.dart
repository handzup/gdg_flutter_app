import 'package:gdg_flutter_app/utils/hive.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => HiveWrapper());
}
