import 'package:banca_creditos/presentation/pages/auth/auth_binding.dart';
import 'package:banca_creditos/presentation/pages/auth/check_screen.dart';
import 'package:banca_creditos/presentation/pages/auth/login_screen.dart';
import 'package:banca_creditos/presentation/pages/auth/register_screen.dart';
import 'package:banca_creditos/presentation/pages/credit_result/credit_result_screen.dart';
import 'package:banca_creditos/presentation/pages/home/credit_bindings.dart';
import 'package:banca_creditos/presentation/pages/home/history/credit_history.dart';
import 'package:banca_creditos/presentation/pages/home/homepage_screen.dart';
import 'package:banca_creditos/presentation/pages/home/widgets/loader_widget.dart';
import 'package:banca_creditos/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/onboarding',
        page: () => OnboardingScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
        binding: AuthBinding(),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
          name: '/login',
          page: () => LoginScreen(),
          middlewares: [MyMiddelware()],
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 200),
          binding: AuthBinding()),
      GetPage(
        name: '/check',
        page: () => const CheckScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/home',
        page: () => HomepageScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
        bindings: [CreditBinding(), AuthBinding()],
      ),
      GetPage(
          name: '/history',
          page: () => CreditHistoryScreen(),
          middlewares: [MyMiddelware()],
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 200),
          binding: CreditBinding()),
      GetPage(
        name: '/loading',
        page: () => const LoaderWidget(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
        name: '/result',
        page: () => CreditResultScreen(),
        middlewares: [MyMiddelware()],
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 200),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
