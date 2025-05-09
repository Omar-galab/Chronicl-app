import 'package:chronicle/core/constans/images.dart';
import 'package:chronicle/core/theme/app_colors.dart';
import 'package:chronicle/core/ui/widget/defult_button.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_bloc.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_event.dart';
import 'package:chronicle/feature/auth/pressentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static const String rout = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserBloc, UserState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Chronicle',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  SvgPicture.asset(Images.login),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Collabrate with freinds to craft unique stories',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const Spacer(),
                  DefultButton(
                    text: 'Login with Google',
                    textColor: AppColors.textColor,
                    backgroundColore: AppColors.secondary,
                    onPressed: () {
                      context.read<UserBloc>().add(LoginWithGoogleEvent());
                    },
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state.status == UserStatus.error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage ?? '')));
            }
          },
        ),
      ),
    );
  }
}
