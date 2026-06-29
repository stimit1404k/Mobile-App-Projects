import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_clone/core/configs/app_colors.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.chooseModeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(AppVectors.spotifyLogo),
              ),

              const Spacer(),

              const Text(
                'Choose Mode',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(
                            ThemeMode.dark,
                          );
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.darkGrey,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.darkBackground,
                                ),
                              ),
                              child: const Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Dark Mode',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemeCubit>().updateTheme(
                            ThemeMode.light,
                          );
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.darkGrey,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.darkBackground,
                                ),
                              ),
                              child: const Icon(
                                Icons.light_mode,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Light Mode',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              BasicAppButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupOrSignin()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
