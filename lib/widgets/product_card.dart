import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:key_concept_practical_task/core/const/app_colors.dart';
import 'package:key_concept_practical_task/view/cart/cart_controller.dart';
import 'package:key_concept_practical_task/view/home/home_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../data/models/product_model.dart';

class ProductCard extends GetView<HomeController> {
  final ProductModel product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x0f000000),
            offset: Offset(4, 6),
            blurRadius: 16,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: product.image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(width: 80, height: 80, color: Colors.white),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("₹${product.price}"),
                OutlinedButton(
                  onPressed: () => controller.addToCart(product),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 30.h),
                    side: BorderSide(color: AppColors.black, width: 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.black),
                      10.horizontalSpace,
                      Obx(() {
                        return Text(
                          controller.cartProducts.contains(product)
                              ? "Added"
                              : "Add",
                          style: TextStyle(color: AppColors.black),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
