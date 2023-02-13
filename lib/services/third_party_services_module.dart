import 'package:dialog_service/dialog_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  DialogService get dialogService;
}
