import 'package:get/get.dart';
import 'package:key_concept_practical_task/data/models/product_model.dart';
import 'package:key_concept_practical_task/routes/routes_name.dart';

class HomeController extends GetxController {
  final List<ProductModel> productList = [
    ProductModel(
      id: 1,
      name: "Classic T-Shirt",
      price: 499,
      image: "https://picsum.photos/200/300",
      category: "T-Shirts",
    ),
    ProductModel(
      id: 2,
      name: "Coffee Mug",
      price: 299,
      image: "https://picsum.photos/200/200",
      category: "Mugs",
    ),
    ProductModel(
      id: 3,
      name: "Baseball Cap",
      price: 199,
      image: "https://picsum.photos/200/100",
      category: "Caps",
    ),
    ProductModel(
      id: 4,
      name: "Graphic Tee",
      price: 599,
      image: "https://picsum.photos/200/400",
      category: "T-Shirts",
    ),
    ProductModel(
      id: 5,
      name: "Travel Mug",
      price: 399,
      image: "https://picsum.photos/200/500",
      category: "Mugs",
    ),
  ];

  RxString selectedCategory = "".obs;
  RxList<String> categories = <String>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  RxList<ProductModel> cartProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() {
    extractCategories();
    applyFilter("");
  }

  void extractCategories() {
    categories.value = productList.map((p) => p.category).toSet().toList();
  }

  void applyFilter(String category) {
    selectedCategory.value = category;
    if (category == "") {
      filteredProducts.value = productList;
    } else {
      filteredProducts.value = productList
          .where((p) => p.category == category)
          .toList();
    }
  }

  void onTapCart() {
    Get.toNamed(RoutesName.cart, arguments: cartProducts);
  }

  void addToCart(ProductModel product) {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product); // remove if already added
    } else {
      cartProducts.add(product); // add if not in cart
    }
  }
}
