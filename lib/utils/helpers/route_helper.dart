import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myapp/modules/landing_screen/views/landing_screen.dart';
import 'package:myapp/modules/landing_screen/views/screens/payment_details.dart';
import 'package:myapp/modules/landing_screen/views/screens/payment_summary.dart';
import 'package:myapp/modules/landing_screen/views/screens/payroll_information.dart';
import 'package:myapp/modules/landing_screen/views/screens/setup_bankaccount.dart';
import 'package:myapp/modules/landing_screen/views/screens/splash_screen.dart';
import 'package:myapp/modules/landing_screen/views/screens/verify_card.dart';

class AppPages {
  static List<GetPage<dynamic>> getPages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: '/', page: () => LandingScreen()),
    GetPage(name: AppRoutes.setupBankAccount, page: () => SetupBankaccount()),
    GetPage(name: AppRoutes.verifyCard, page: () => VerifyCreditCard()),
    GetPage(name: AppRoutes.paymentDetails, page: () => PaymentDetailsForm()),
    GetPage(name: AppRoutes.paymentSummary, page: () => PaymentSummary()),
    GetPage(
      name: AppRoutes.payrollInformation,
      page: () => PayrollInformation(),
    ),
  ];
}

class AppRoutes {
  static const splash = '/splash';
  static const landing = '/landing';
  static const setupBankAccount = '/setup-bankaccount';
  static const verifyCard = '/verify-card';
  static const paymentDetails = '/payment-details';
  static const paymentSummary = '/payment-summary';
  static const payrollInformation = '/payroll-information';
}
