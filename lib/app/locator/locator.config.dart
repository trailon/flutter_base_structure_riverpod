// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dialog_service/dialog_service.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../services/api_service.dart' as _i3;
import '../../services/popup_service.dart' as _i5;
import '../../services/scaffold_messenger_services.dart' as _i6;
import '../../services/third_party_services_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.ApiService>(() => _i3.ApiService());
  gh.lazySingleton<_i4.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i5.PopupService>(() => _i5.PopupService());
  gh.lazySingleton<_i6.ScaffoldMessengerService>(
      () => _i6.ScaffoldMessengerService());
  return get;
}

class _$ThirdPartyServicesModule extends _i7.ThirdPartyServicesModule {
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
}
