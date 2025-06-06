import 'package:get/get.dart';
import '../../data/models/product_model.dart';

class CartController extends GetxController {
  RxList<ProductModel> cartItems = Get.arguments;

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  int get itemCount => cartItems.length;

  int get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
