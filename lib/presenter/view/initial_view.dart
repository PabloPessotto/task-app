import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskforme/shared/components/blur/blur_background.dart';
import 'package:taskforme/shared/components/circle/background_circle.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
import 'package:taskforme/shared/resources/assets/app_assets.dart';
import 'package:taskforme/shared/resources/routes/routes.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _checkToken();
      },
    );
    super.initState();
  }

  void _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    print('token - $token');
    bool hasExpired = token.isEmpty || JwtDecoder.isExpired(token);
    if (token.isEmpty || hasExpired) {
      pushUntilView(Routes.login);
    } else {
      pushUntilView(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = screenHeight(context);
    return BlurBackground(
      blur: 300,
      circles: [
        const BackgroundCircle(
          right: -70,
          colors: [
            Colors.tealAccent,
            Colors.purple,
          ],
        ),
        BackgroundCircle(
          left: -50,
          top: -60,
          size: 150,
          colors: [
            Colors.orangeAccent,
            Colors.red[900]!,
          ],
        ),
        BackgroundCircle(
          left: -70,
          top: 210,
          size: 200,
          colors: [
            Colors.green[900]!,
            Colors.limeAccent,
          ],
        ),
        BackgroundCircle(
          bottom: -100,
          left: -30,
          colors: [
            Colors.purple,
            Colors.blue[600]!,
          ],
        ),
      ],
      scaffold: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            Assets.logo,
            height: height / 7.5,
          ),
        ),
      ),
    );
  }
}
