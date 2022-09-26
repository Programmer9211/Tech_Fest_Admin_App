import 'package:get/get.dart';

import '../modules/authentication_screen/bindings/authentication_screen_binding.dart';
import '../modules/authentication_screen/views/authentication_screen_view.dart';
import '../modules/create_event/bindings/create_event_binding.dart';
import '../modules/create_event/views/create_event_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/participants_list_screen/bindings/participants_list_screen_binding.dart';
import '../modules/participants_list_screen/views/participants_list_screen_view.dart';
import '../modules/profile_screen/bindings/profile_screen_binding.dart';
import '../modules/profile_screen/views/profile_screen_view.dart';
import '../modules/signin_screen/bindings/signin_screen_binding.dart';
import '../modules/signin_screen/views/signin_screen_view.dart';
import '../modules/signup_screen/bindings/signup_screen_binding.dart';
import '../modules/signup_screen/views/signup_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN_SCREEN,
      page: () => SigninScreenView(),
      binding: SigninScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => SignupScreenView(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_EVENT,
      page: () => const CreateEventView(),
      binding: CreateEventBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION_SCREEN,
      page: () => AuthenticationScreenView(),
      binding: AuthenticationScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SCREEN,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: _Paths.PARTICIPANTS_LIST_SCREEN,
      page: () => ParticipantsListScreenView(),
      binding: ParticipantsListScreenBinding(),
    ),
  ];
}
