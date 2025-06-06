import 'package:get/get.dart';
import 'package:key_concept_practical_task/view/cart/cart.dart';
import 'package:key_concept_practical_task/view/cart/cart_controller.dart';
import 'package:key_concept_practical_task/view/home/home.dart';
import 'package:key_concept_practical_task/view/home/home_controller.dart';
import 'package:key_concept_practical_task/view/splash/splash.dart';

import 'routes_name.dart';

/// Function to define a GetPage route
GetPage getPage({
  String? name,
  GetPageBuilder? page,
  Bindings? binding,
  List<GetPage<dynamic>>? children,
}) {
  return GetPage(
    name: name!,
    page: page!,
    binding: binding,
    children: children ?? [],
  );
}

/// List of all routes
List<GetPage> pages = [
  GetPage(name: RoutesName.splash, page: () => Splash()),
  GetPage(
    name: RoutesName.home,
    page: () => const Home(),
    binding: BindingsBuilder(() => Get.lazyPut(() => HomeController())),
  ),
  GetPage(
    name: RoutesName.cart,
    page: () => const Cart(),
    binding: BindingsBuilder(() => Get.lazyPut(() => CartController())),
  ),
];
