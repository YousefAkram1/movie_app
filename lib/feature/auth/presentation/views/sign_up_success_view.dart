import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/values/app_colors.dart';
import '../../../../core/utils/values/app_routes.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../widgets/app_text_field.dart';

class SignUpSuccess extends StatefulWidget {
  const SignUpSuccess({super.key});

  @override
  State<SignUpSuccess> createState() => _SignUpSuccessState();
}

class _SignUpSuccessState extends State<SignUpSuccess> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: myKey,
            child: Column(
              children: [
                SizedBox(height: 98.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign up successfully!",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight(500),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Text(
                        'Tell us more about you',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.authTextColor,
                        ),
                      ),
                      SizedBox(height: 23.h),
                      AppTextField(
                        textInputFormatter: [],
                        hint: 'Your name',
                        controller: nameController,
                      ),
                      SizedBox(height: 9.h),
                      AppTextField(
                        textInputFormatter: [],
                        hint: 'Your phone number',
                        controller: numberController,
                      ),
                      SizedBox(height: 9.h),

                      AppTextField(
                        textInputFormatter: [],
                        hint: 'Current City/pincode',
                        controller: countryController,
                      ),

                      SizedBox(height: 348.h),
                      TextButton(
                        onPressed: () {
                          if (myKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.signIn,
                            );
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                message:
                                    "Good job, your data added successfully. Have a nice day",
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(Size(340.w, 53.h)),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16).r,
                            ),
                          ),
                        ),
                        child: Text(
                          "Coninue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight(600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
