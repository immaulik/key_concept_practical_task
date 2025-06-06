import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_concept_practical_task/view/home/home_controller.dart';
import 'package:key_concept_practical_task/widgets/product_card.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          PopupMenuButton<String?>(
            icon: Icon(Icons.filter_alt),
            onSelected: (value) {
              controller.applyFilter(value ?? "");
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: "", child: Text("All Products")),
              ...controller.categories.map(
                (category) =>
                    PopupMenuItem(value: category, child: Text(category)),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => controller.onTapCart(),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            final selected = controller.selectedCategory.value;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                selected == "" ? "Showing: All Products" : "Showing: $selected",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            );
          }),
          Expanded(
            child: Obx(
              () => GridView.builder(
                padding: EdgeInsets.all(12),
                itemCount: controller.filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  final product = controller.filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
