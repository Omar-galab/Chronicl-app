import 'package:chronicle/core/di/get_it.dart';
import 'package:chronicle/core/router/app_router.dart';
import 'package:chronicle/core/theme/app_theme.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_bloc.dart';
import 'package:chronicle/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Enable debug painting to show widget boundaries

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();

  debugPaintSizeEnabled = false;
  // Alternatively, you can use this to show baselines
  // debugPaintBaselinesEnabled = true;
  // Or this to highlight repaints
  // debugRepaintRainbowEnabled = true;

  runApp(
    BlocProvider(
      create: (context) => getIt<UserBloc>(),
      child: MaterialApp.router(routerConfig: AppRouter.router ,theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,),
    ),
  );
}
