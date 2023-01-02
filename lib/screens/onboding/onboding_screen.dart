import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/widgets/animated_button.dart';
import 'package:rive_animation/widgets/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _buttonAnimationController;

  @override
  void initState() {
    _buttonAnimationController = OneShotAnimation(
        'active',
        autoplay: false
    );
    super.initState();
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  Future<Object?> customSigninDialog(BuildContext context) {
    return showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: 'Sign in',
        context: context,
        pageBuilder: (context, _, __) =>
            Center(
              child: Container(
                height: 620,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 24
                ),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.94),
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 34,
                                fontFamily: 'Poppins'
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text('Access to 240+ hours of content.'
                                ' Learn design and code, '
                                'by building real apps with '
                                'Flutter and Swift.',
                              textAlign: TextAlign.center,),
                          ),
                          SignInForm(),
                          Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0
                                ),
                                child: Text(
                                  'OR',
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: Text(
                              'Sign up with Email, Apple or Google',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/email_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/apple_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/google_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -48,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: MediaQuery.of(context).size.width * 1.7,
              bottom: 200,
              left: 100,
              child: Image.asset('assets/Backgrounds/Spline.png')
          ),
          RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10,
                ),
                child: SizedBox(),
              )
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          'Learn design & code',
                          style: TextStyle(
                              fontSize: 60,
                              fontFamily: 'Poppins',
                              height: 1.2
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Don\'t skip design. Learn design and code,'
                            ' by building real apps with Flutter and Swift.'
                            'Complete courses about the best tools.'),
                      ],
                    ),
                  ),
                  Spacer(),
                  AnimatedButton(
                    buttonAnimationController: _buttonAnimationController,
                    press: () {
                      _buttonAnimationController.isActive = true;
                      customSigninDialog(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        'Purchase includes access to 30+ courses, '
                            '240+ premium tutorials, 120+ hours of video, '
                            'source files and certificates.'
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}