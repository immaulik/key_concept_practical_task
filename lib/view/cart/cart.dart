import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:key_concept_practical_task/core/const/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'cart_controller.dart';

class Cart extends GetView<CartController> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.sp),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Pay ₹${controller.totalPrice}",
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ),
      appBar: AppBar(title: Text("Cart")),
      body: Obx(
        () => controller.cartItems.isEmpty
            ? Center(child: Text("Cart is empty"))
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(thickness: 0.1);
                      },
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = controller.cartItems[index];
                        return ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              imageUrl: controller.cartItems[index].image,
                              fit: BoxFit.cover,
                              width: 100.w,
                              height: 100.h,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          title: Text(item.name),
                          subtitle: Text("₹${item.price}"),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle_sharp),
                            onPressed: () => controller.removeFromCart(item),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
