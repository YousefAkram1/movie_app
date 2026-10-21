import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/values/app_routes.dart';
import '../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../widgets/chip_logo_items.dart';
import '../widgets/divider_and_or.dart';
import '../widgets/textAndTapedTextComponent.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../../../../core/utils/values/app_colors.dart';
import '../widgets/app_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pushReplacementNamed(context, AppRoutes.signUpSuccess);
            return showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message:
                    "Good job, your sign up is successful. Have a nice day",
              ),
            );
          } else if (state is SignUpFailureState) {
            return showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: myKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, right: 18).w,
                      child: Align(
                        alignment: AlignmentGeometry.topRight,
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight(400),
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 69.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26).w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight(500),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 23.h),
                          AppTextField(
                            hint: 'E-mail',
                            controller: emailController,
                          ),
                          SizedBox(height: 14.h),
                          AppTextField(
                            keyboardType: TextInputType.numberWithOptions(),

                            hint: 'Password',
                            controller: passwordController,
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                MyAssets.assetsImagesVisibilityOff,
                              ),
                            ),
                          ),

                          SizedBox(height: 28.h),
                          TextButton(
                            onPressed: () {
                              if (myKey.currentState!.validate()) {
                                context.read<SignUpCubit>().signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            style: ButtonStyle(
                              fixedSize: WidgetStatePropertyAll(
                                Size(340.w, 53.h),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16).r,
                                ),
                              ),
                            ),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight(600),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          TextAndTapedTextComponent(
                            mainText:
                                'By clicking the “sign up” button, '
                                'you accept the terms of the ',
                            pageText: 'Privacy Policy',
                            onTap: () {},
                            textAlign: TextAlign.start,
                          ),

                          SizedBox(height: 28.h),
                          DividerAndOr(),
                          SizedBox(height: 29.h),
                          ChipLogoItems(),
                          SizedBox(height: 219.h),
                        ],
                      ),
                    ),
                    TextAndTapedTextComponent(
                      textAlign: TextAlign.center,
                      mainText: 'Already have an account? ',
                      pageText: 'Sign In',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.signIn,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
