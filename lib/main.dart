import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie_app/injectable.dart';
import 'core/utils/values/app_colors.dart';
import 'feature/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'feature/auth/presentation/views/sign_up_success_view.dart';
import 'feature/auth/presentation/views/sign_up_view.dart';
import 'firebase_options.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/theme/light_theme.dart';
import 'core/utils/values/app_routes.dart';
import 'feature/home/presentation/cubit/details_cubit/movie_details_cubit.dart';
import 'feature/home/presentation/cubit/home_cubit/movie_list_cubit.dart';
import 'feature/home/presentation/cubit/search_cubit/movie_search_cubit.dart';
import 'feature/auth/presentation/views/sign_in_view.dart';
import 'feature/on_boarding/presentation/views/on_boarding_one.dart';
import 'feature/on_boarding/presentation/views/on_boardin_two.dart';

void main() async {
  Bloc.observer = Observer();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FlutterStatusbarcolor.setStatusBarColor(AppColors.primary);
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  configerDependancy();

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getit<MovieListCubit>()..getMovieList(),
            ),
            BlocProvider(create: (context) => getit<MovieDetailsCubit>()),
            BlocProvider(create: (context) => getit<MovieSearchCubit>()),
            BlocProvider(create: (context) => SignInCubit()),
            BlocProvider(create: (context) => SignUpCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            routes: {
              AppRoutes.onBoardingOne: (context) => OnBoardingOne(),
              AppRoutes.onBoardingTwo: (context) => OnBoardingTwo(),
              AppRoutes.signIn: (context) => SignIn(),
              AppRoutes.signUp: (context) => SignUp(),
              AppRoutes.signUpSuccess: (context) => SignUpSuccess(),
            },
            home: OnBoardingOne(),
          ),
        );
      },
    );
  }
}
