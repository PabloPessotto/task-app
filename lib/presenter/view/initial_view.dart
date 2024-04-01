import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskforme/shared/functions/navigator/navigator.dart';
import 'package:taskforme/shared/functions/screen_size/sizes.dart';
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blue[50]!,
              Colors.blue[100]!,
              Colors.blue[100]!,
              Colors.blue[300]!,
              Colors.blue[400]!,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Center(
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) => LinearGradient(
              colors: [
                Colors.blue[600]!,
                Colors.blue[800]!,
                Colors.blue[900]!,
              ],
            ).createShader(bounds),
            child: Icon(
              Icons.check_box_rounded,
              size: height / 5,
            ),
          ),
        ),
      ),
    );
  }
}
