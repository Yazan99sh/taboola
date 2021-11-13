// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i59;
import '../module_auth/authoriazation_module.dart' as _i48;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i18;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i15;
import '../module_auth/service/auth_service/auth_service.dart' as _i19;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i28;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i30;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i44;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i45;
import '../module_chat/chat_module.dart' as _i55;
import '../module_chat/manager/chat/chat_manager.dart' as _i32;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i20;
import '../module_chat/service/chat/char_service.dart' as _i33;
import '../module_chat/state_manager/chat_state_manager.dart' as _i34;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i49;
import '../module_customer/customers_module.dart' as _i51;
import '../module_customer/manager/customers_manager.dart' as _i22;
import '../module_customer/repository/customer_repository.dart' as _i21;
import '../module_customer/service/customers_service.dart' as _i23;
import '../module_customer/state_manager/customer_details_state_manager.dart'
    as _i36;
import '../module_customer/state_manager/customers_state_manager.dart' as _i24;
import '../module_customer/ui/screen/customer_details_screen.dart' as _i50;
import '../module_customer/ui/screen/customers_screen.dart' as _i37;
import '../module_delivery/delivery_module.dart' as _i58;
import '../module_delivery/manager/delivery_manager.dart' as _i38;
import '../module_delivery/repository/delivery_repository.dart' as _i25;
import '../module_delivery/service/delivery_service.dart' as _i39;
import '../module_delivery/state_manager/customer_details_state_manager.dart'
    as _i35;
import '../module_delivery/state_manager/delivery_operators_state_manager.dart'
    as _i52;
import '../module_delivery/ui/screen/operators_screen.dart' as _i56;
import '../module_home/home_module.dart' as _i57;
import '../module_home/manager/home_manager.dart' as _i41;
import '../module_home/repository/home_repository.dart' as _i26;
import '../module_home/service/home_service.dart' as _i42;
import '../module_home/state_manager/home_state_manager.dart' as _i43;
import '../module_home/ui/screen/home_screen.dart' as _i53;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_main/main_module.dart' as _i16;
import '../module_main/ui/screen/main_screen.dart' as _i9;
import '../module_network/http_client/http_client.dart' as _i13;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i10;
import '../module_notifications/repository/notification_repo.dart' as _i29;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i40;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_settings/settings_module.dart' as _i54;
import '../module_settings/ui/settings_page/settings_page.dart' as _i46;
import '../module_splash/splash_module.dart' as _i47;
import '../module_splash/ui/screen/splash_screen.dart' as _i31;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i11;
import '../module_theme/service/theme_service/theme_service.dart' as _i14;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i17;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i12;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i27;
import '../utils/global/global_state_manager.dart' as _i60;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.ChatHiveHelper>(() => _i4.ChatHiveHelper());
  gh.factory<_i5.LocalNotificationService>(
      () => _i5.LocalNotificationService());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.MainScreen>(() => _i9.MainScreen());
  gh.factory<_i10.NotificationsPrefsHelper>(
      () => _i10.NotificationsPrefsHelper());
  gh.factory<_i11.ThemePreferencesHelper>(() => _i11.ThemePreferencesHelper());
  gh.factory<_i12.UploadRepository>(() => _i12.UploadRepository());
  gh.factory<_i13.ApiClient>(() => _i13.ApiClient(get<_i8.Logger>()));
  gh.factory<_i14.AppThemeDataService>(
      () => _i14.AppThemeDataService(get<_i11.ThemePreferencesHelper>()));
  gh.factory<_i15.AuthRepository>(
      () => _i15.AuthRepository(get<_i13.ApiClient>(), get<_i8.Logger>()));
  gh.factory<_i16.MainModule>(() => _i16.MainModule(get<_i9.MainScreen>()));
  gh.factory<_i17.UploadManager>(
      () => _i17.UploadManager(get<_i12.UploadRepository>()));
  gh.factory<_i18.AuthManager>(
      () => _i18.AuthManager(get<_i15.AuthRepository>()));
  gh.factory<_i19.AuthService>(() =>
      _i19.AuthService(get<_i3.AuthPrefsHelper>(), get<_i18.AuthManager>()));
  gh.factory<_i20.ChatRepository>(() =>
      _i20.ChatRepository(get<_i13.ApiClient>(), get<_i19.AuthService>()));
  gh.factory<_i21.CustomerRepository>(() =>
      _i21.CustomerRepository(get<_i13.ApiClient>(), get<_i19.AuthService>()));
  gh.factory<_i22.CustomersManager>(
      () => _i22.CustomersManager(get<_i21.CustomerRepository>()));
  gh.factory<_i23.CustomersService>(
      () => _i23.CustomersService(get<_i22.CustomersManager>()));
  gh.factory<_i24.CustomersStateManager>(
      () => _i24.CustomersStateManager(get<_i23.CustomersService>()));
  gh.factory<_i25.DeliveryRepository>(() =>
      _i25.DeliveryRepository(get<_i13.ApiClient>(), get<_i19.AuthService>()));
  gh.factory<_i26.HomeRepository>(() =>
      _i26.HomeRepository(get<_i13.ApiClient>(), get<_i19.AuthService>()));
  gh.factory<_i27.ImageUploadService>(
      () => _i27.ImageUploadService(get<_i17.UploadManager>()));
  gh.factory<_i28.LoginStateManager>(
      () => _i28.LoginStateManager(get<_i19.AuthService>()));
  gh.factory<_i29.NotificationRepo>(() =>
      _i29.NotificationRepo(get<_i13.ApiClient>(), get<_i19.AuthService>()));
  gh.factory<_i30.RegisterStateManager>(
      () => _i30.RegisterStateManager(get<_i19.AuthService>()));
  gh.factory<_i31.SplashScreen>(
      () => _i31.SplashScreen(get<_i19.AuthService>()));
  gh.factory<_i32.ChatManager>(
      () => _i32.ChatManager(get<_i20.ChatRepository>()));
  gh.factory<_i33.ChatService>(() => _i33.ChatService(get<_i32.ChatManager>()));
  gh.factory<_i34.ChatStateManager>(
      () => _i34.ChatStateManager(get<_i33.ChatService>()));
  gh.factory<_i35.CustomerDetailsStateManager>(
      () => _i35.CustomerDetailsStateManager(get<_i23.CustomersService>()));
  gh.factory<_i36.CustomerDetailsStateManager>(
      () => _i36.CustomerDetailsStateManager(get<_i23.CustomersService>()));
  gh.factory<_i37.CustomersScreen>(
      () => _i37.CustomersScreen(get<_i24.CustomersStateManager>()));
  gh.factory<_i38.DeliveryManager>(
      () => _i38.DeliveryManager(get<_i25.DeliveryRepository>()));
  gh.factory<_i39.DeliveryService>(
      () => _i39.DeliveryService(get<_i38.DeliveryManager>()));
  gh.factory<_i40.FireNotificationService>(() => _i40.FireNotificationService(
      get<_i10.NotificationsPrefsHelper>(), get<_i29.NotificationRepo>()));
  gh.factory<_i41.HomeManager>(
      () => _i41.HomeManager(get<_i26.HomeRepository>()));
  gh.factory<_i42.HomeService>(() => _i42.HomeService(get<_i41.HomeManager>()));
  gh.factory<_i43.HomeStateManager>(
      () => _i43.HomeStateManager(get<_i42.HomeService>()));
  gh.factory<_i44.LoginScreen>(
      () => _i44.LoginScreen(get<_i28.LoginStateManager>()));
  gh.factory<_i45.RegisterScreen>(
      () => _i45.RegisterScreen(get<_i30.RegisterStateManager>()));
  gh.factory<_i46.SettingsScreen>(() => _i46.SettingsScreen(
      get<_i19.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i14.AppThemeDataService>(),
      get<_i40.FireNotificationService>()));
  gh.factory<_i47.SplashModule>(
      () => _i47.SplashModule(get<_i31.SplashScreen>()));
  gh.factory<_i48.AuthorizationModule>(() => _i48.AuthorizationModule(
      get<_i44.LoginScreen>(), get<_i45.RegisterScreen>()));
  gh.factory<_i49.ChatPage>(() => _i49.ChatPage(
      get<_i34.ChatStateManager>(),
      get<_i27.ImageUploadService>(),
      get<_i19.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i50.CustomerDetailsScreen>(() =>
      _i50.CustomerDetailsScreen(get<_i36.CustomerDetailsStateManager>()));
  gh.factory<_i51.CustomersModule>(() => _i51.CustomersModule(
      get<_i37.CustomersScreen>(), get<_i50.CustomerDetailsScreen>()));
  gh.factory<_i52.DeliveryOperatorsStateManager>(
      () => _i52.DeliveryOperatorsStateManager(get<_i39.DeliveryService>()));
  gh.factory<_i53.HomeScreen>(
      () => _i53.HomeScreen(get<_i43.HomeStateManager>()));
  gh.factory<_i54.SettingsModule>(
      () => _i54.SettingsModule(get<_i46.SettingsScreen>()));
  gh.factory<_i55.ChatModule>(
      () => _i55.ChatModule(get<_i49.ChatPage>(), get<_i19.AuthService>()));
  gh.factory<_i56.DeliveryOperatorsScreen>(() =>
      _i56.DeliveryOperatorsScreen(get<_i52.DeliveryOperatorsStateManager>()));
  gh.factory<_i57.HomeModule>(() => _i57.HomeModule(get<_i53.HomeScreen>()));
  gh.factory<_i58.DeliveryModule>(() => _i58.DeliveryModule(
      get<_i56.DeliveryOperatorsScreen>(), get<_i50.CustomerDetailsScreen>()));
  gh.factory<_i59.MyApp>(() => _i59.MyApp(
      get<_i14.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i40.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i47.SplashModule>(),
      get<_i48.AuthorizationModule>(),
      get<_i55.ChatModule>(),
      get<_i54.SettingsModule>(),
      get<_i16.MainModule>(),
      get<_i57.HomeModule>(),
      get<_i51.CustomersModule>(),
      get<_i58.DeliveryModule>()));
  gh.singleton<_i60.GlobalStateManager>(_i60.GlobalStateManager());
  return get;
}
