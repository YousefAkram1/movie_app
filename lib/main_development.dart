import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie_app/injectable.dart';
import 'package:movie_app/movie_app.dart';
import 'core/utils/values/app_colors.dart';
import 'firebase_options.dart';
import 'core/utils/bloc_observer.dart';

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
