import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'get_started_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigate to GetStartedScreen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo_without_bg.svg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            StreamBuilder<String>(
              stream: _animatedTextStream(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style: const TextStyle(fontSize: 30, fontFamily: 'SFProText',fontWeight: FontWeight.w600),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Stream<String> _animatedTextStream() async* {
    const text = 'Hello...';
    for (int i = 1; i <= text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      yield text.substring(0, i);
    }
  }
}