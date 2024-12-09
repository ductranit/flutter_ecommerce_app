import 'package:ecommerce_app/app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:universal_image/universal_image.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  List<Widget> _buildInputs() {
    return [
      FormBuilderTextField(
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        initialValue: controller.user.value?.name,
        decoration: const InputDecoration(
            label: Text('Name'), prefixIcon: Icon(Icons.people)),
        name: 'name',
      ),
      SizedBox(height: 20.w),
      FormBuilderTextField(
          initialValue: controller.user.value?.email,
          decoration: const InputDecoration(
              label: Text('Email'), prefixIcon: Icon(Icons.email)),
          name: 'email',
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ])),
      SizedBox(height: 20.w),
      FormBuilderTextField(
          initialValue: controller.user.value?.phone,
          decoration: const InputDecoration(
              label: Text('Phone number'), prefixIcon: Icon(Icons.phone)),
          name: 'phone',
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.phoneNumber(),
          ])),
    ];
  }

  List<Widget> _buildPassword() {
    return [
      FormBuilderTextField(
          initialValue: '',
          decoration: const InputDecoration(
              label: Text('Password'), prefixIcon: Icon(Icons.lock)),
          name: 'password',
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6),
          ])),
      SizedBox(height: 20.w),
      FormBuilderTextField(
          initialValue: '',
          decoration: const InputDecoration(
              label: Text('Confirm Password'), prefixIcon: Icon(Icons.lock)),
          name: 'password_confirmation',
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6),
          ])),
    ];
  }

  List<Widget> _buildAddress() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = context.theme;
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                constraints: BoxConstraints(maxWidth: 500.w),
                child: FormBuilder(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundColor: baseTheme.primaryColor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: UniversalImage(
                                  controller.user.value?.avatar ?? '',
                                  fit: BoxFit.cover,
                                  width: 400.w,
                                  height: 400.h,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.w),
                          if (controller.mode.value == ProfileViewMode.profile)
                            ..._buildInputs(),
                          if (controller.mode.value == ProfileViewMode.password)
                            ..._buildPassword(),
                          if (controller.mode.value == ProfileViewMode.address)
                            ..._buildAddress(),
                          SizedBox(height: 40.w),
                          CustomButton(
                            text: 'Update',
                            onPressed: () {
                              if (formKey.currentState?.validate() == true) {
                                switch (controller.mode.value) {
                                  case ProfileViewMode.profile:
                                    final formData =
                                        formKey.currentState!.value;
                                    controller.updateUser(
                                        formData['name'] ?? '',
                                        formData['email'] ?? '',
                                        formData['phone'] ?? '');
                                    break;
                                  case ProfileViewMode.password:
                                    controller.mode.value =
                                        ProfileViewMode.profile;
                                    break;
                                  case ProfileViewMode.address:
                                    controller.mode.value =
                                        ProfileViewMode.profile;
                                    break;
                                }
                              }
                            },
                            fontSize: 16.sp,
                            radius: 12.r,
                            verticalPadding: 12.h,
                            hasShadow: true,
                            shadowColor: baseTheme.primaryColor,
                            shadowOpacity: 0.3,
                            shadowBlurRadius: 4,
                            shadowSpreadRadius: 0,
                          ),
                          SizedBox(height: 5.w),
                          Visibility(
                            visible: controller.mode.value ==
                                ProfileViewMode.profile,
                            child: CustomButton(
                              text: 'Change Password',
                              onPressed: () {
                                controller.mode.value =
                                    ProfileViewMode.password;
                              },
                              fontSize: 16.sp,
                              radius: 12.r,
                              verticalPadding: 12.h,
                              hasShadow: true,
                              shadowColor: baseTheme.primaryColor,
                              shadowOpacity: 0.3,
                              shadowBlurRadius: 4,
                              shadowSpreadRadius: 0,
                            ),
                          ),
                          SizedBox(height: 5.w),
                          Visibility(
                            visible: controller.mode.value ==
                                ProfileViewMode.profile,
                            child: CustomButton(
                              text: 'Change Address',
                              onPressed: () {
                                controller.mode.value = ProfileViewMode.address;
                              },
                              fontSize: 16.sp,
                              radius: 12.r,
                              verticalPadding: 12.h,
                              hasShadow: true,
                              shadowColor: baseTheme.primaryColor,
                              shadowOpacity: 0.3,
                              shadowBlurRadius: 4,
                              shadowSpreadRadius: 0,
                            ),
                          ),
                          40.verticalSpace
                        ])),
              )),
          Positioned(
              left: 20,
              top: 50,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: UniversalImage(
                  Icons.close,
                  height: 50,
                  width: 50,
                  color: baseTheme.bottomAppBarTheme.color,
                ),
              ))
        ],
      ),
    );
  }
}
