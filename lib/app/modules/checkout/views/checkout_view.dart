import 'package:ecommerce_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:universal_image/universal_image.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = context.theme;
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () => Stack(children: [
              Container(
                padding: EdgeInsets.all(20.w),
                child: InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: WebUri(controller.checkoutUrl)),
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                    Get.find<Logger>()
                        .i('navigate to ${navigationAction.request.url}');
                    return NavigationActionPolicy.ALLOW;
                  },
                ),
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: UniversalImage(
                      Icons.close,
                      height: 50,
                      width: 50,
                      color: baseTheme.secondaryHeaderColor,
                    ),
                  ))
            ]),
          )),
    );
  }
}
