import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/values/app_routes.dart';
import '../cubit/sign_in_cubit/sign_in_cubit.dart';
import '../widgets/chip_logo_items.dart';
import '../widgets/divider_and_or.dart';
import '../widgets/TextAndTapedTextComponent.dart';
import '../../../home/presentation/views/home_view.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import '../../../../core/utils/values/app_colors.dart';
import '../widgets/app_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (ctx, state) {
          if (state is SignInSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
            return showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message:
                    "Good job, your sign in is successful. Have a nice day",
              ),
            );
          } else if (state is SignInFailureState) {
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
                            "Sign In",
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
                            secure: true,
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
                          SizedBox(height: 14.h),
                          Align(
                            alignment: AlignmentGeometry.centerRight,
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight(400),
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          TextButton(
                            onPressed: () async {
                              if (myKey.currentState!.validate()) {
                                await context.read<SignInCubit>().signIn(
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
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight(600),
                              ),
                            ),
                          ),
                          SizedBox(height: 28.h),
                          DividerAndOr(),
                          SizedBox(height: 29.h),
                          ChipLogoItems(),
                          SizedBox(height: 219.h),
                          TextAndTapedTextComponent(
                            mainText: 'Don’t you have an account? ',
                            pageText: 'Sign Up',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.signUp,
                              );
                            },
                          ),
                        ],
                      ),
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
