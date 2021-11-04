// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i44;
import '../module_auth/authoriazation_module.dart' as _i39;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i19;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i15;
import '../module_auth/service/auth_service/auth_service.dart' as _i20;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i26;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i28;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i35;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i36;
import '../module_chat/chat_module.dart' as _i43;
import '../module_chat/manager/chat/chat_manager.dart' as _i30;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i21;
import '../module_chat/service/chat/char_service.dart' as _i31;
import '../module_chat/state_manager/chat_state_manager.dart' as _i32;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i40;
import '../module_home/home_module.dart' as _i41;
import '../module_home/manager/home_manager.dart' as _i22;
import '../module_home/repository/home_repository.dart' as _i16;
import '../module_home/service/home_service.dart' as _i23;
import '../module_home/state_manager/home_state_manager.dart' as _i24;
import '../module_home/ui/screen/home_screen.dart' as _i34;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_main/main_module.dart' as _i17;
import '../module_main/ui/screen/main_screen.dart' as _i9;
import '../module_network/http_client/http_client.dart' as _i13;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i10;
import '../module_notifications/repository/notification_repo.dart' as _i27;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i33;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_settings/settings_module.dart' as _i42;
import '../module_settings/ui/settings_page/settings_page.dart' as _i37;
import '../module_splash/splash_module.dart' as _i38;
import '../module_splash/ui/screen/splash_screen.dart' as _i29;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i11;
import '../module_theme/service/theme_service/theme_service.dart' as _i14;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i18;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i12;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i25;
import '../utils/global/global_state_manager.dart' as _i45;
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
  gh.factory<_i16.HomeRepository>(
      () => _i16.HomeRepository(get<_i13.ApiClient>()));
  gh.factory<_i17.MainModule>(() => _i17.MainModule(get<_i9.MainScreen>()));
  gh.factory<_i18.UploadManager>(
      () => _i18.UploadManager(get<_i12.UploadRepository>()));
  gh.factory<_i19.AuthManager>(
      () => _i19.AuthManager(get<_i15.AuthRepository>()));
  gh.factory<_i20.AuthService>(() =>
      _i20.AuthService(get<_i3.AuthPrefsHelper>(), get<_i19.AuthManager>()));
  gh.factory<_i21.ChatRepository>(() =>
      _i21.ChatRepository(get<_i13.ApiClient>(), get<_i20.AuthService>()));
  gh.factory<_i22.HomeManager>(
      () => _i22.HomeManager(get<_i16.HomeRepository>()));
  gh.factory<_i23.HomeService>(() => _i23.HomeService(get<_i22.HomeManager>()));
  gh.factory<_i24.HomeStateManager>(
      () => _i24.HomeStateManager(get<_i23.HomeService>()));
  gh.factory<_i25.ImageUploadService>(
      () => _i25.ImageUploadService(get<_i18.UploadManager>()));
  gh.factory<_i26.LoginStateManager>(
      () => _i26.LoginStateManager(get<_i20.AuthService>()));
  gh.factory<_i27.NotificationRepo>(() =>
      _i27.NotificationRepo(get<_i13.ApiClient>(), get<_i20.AuthService>()));
  gh.factory<_i28.RegisterStateManager>(
      () => _i28.RegisterStateManager(get<_i20.AuthService>()));
  gh.factory<_i29.SplashScreen>(
      () => _i29.SplashScreen(get<_i20.AuthService>()));
  gh.factory<_i30.ChatManager>(
      () => _i30.ChatManager(get<_i21.ChatRepository>()));
  gh.factory<_i31.ChatService>(() => _i31.ChatService(get<_i30.ChatManager>()));
  gh.factory<_i32.ChatStateManager>(
      () => _i32.ChatStateManager(get<_i31.ChatService>()));
  gh.factory<_i33.FireNotificationService>(() => _i33.FireNotificationService(
      get<_i10.NotificationsPrefsHelper>(), get<_i27.NotificationRepo>()));
  gh.factory<_i34.HomeScreen>(
      () => _i34.HomeScreen(get<_i24.HomeStateManager>()));
  gh.factory<_i35.LoginScreen>(
      () => _i35.LoginScreen(get<_i26.LoginStateManager>()));
  gh.factory<_i36.RegisterScreen>(
      () => _i36.RegisterScreen(get<_i28.RegisterStateManager>()));
  gh.factory<_i37.SettingsScreen>(() => _i37.SettingsScreen(
      get<_i20.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i14.AppThemeDataService>(),
      get<_i33.FireNotificationService>()));
  gh.factory<_i38.SplashModule>(
      () => _i38.SplashModule(get<_i29.SplashScreen>()));
  gh.factory<_i39.AuthorizationModule>(() => _i39.AuthorizationModule(
      get<_i35.LoginScreen>(), get<_i36.RegisterScreen>()));
  gh.factory<_i40.ChatPage>(() => _i40.ChatPage(
      get<_i32.ChatStateManager>(),
      get<_i25.ImageUploadService>(),
      get<_i20.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i41.HomeModule>(() => _i41.HomeModule(get<_i34.HomeScreen>()));
  gh.factory<_i42.SettingsModule>(
      () => _i42.SettingsModule(get<_i37.SettingsScreen>()));
  gh.factory<_i43.ChatModule>(
      () => _i43.ChatModule(get<_i40.ChatPage>(), get<_i20.AuthService>()));
  gh.factory<_i44.MyApp>(() => _i44.MyApp(
      get<_i14.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i33.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i38.SplashModule>(),
      get<_i39.AuthorizationModule>(),
      get<_i43.ChatModule>(),
      get<_i42.SettingsModule>(),
      get<_i17.MainModule>(),
      get<_i41.HomeModule>()));
  gh.singleton<_i45.GlobalStateManager>(_i45.GlobalStateManager());
  return get;
}
