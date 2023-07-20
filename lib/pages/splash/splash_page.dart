import 'package:flutter/material.dart';
import 'package:my_wallet/pages/home/home_page.dart';
import 'package:my_wallet/pages/login/src/utils/password_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordInputView(
            expectedCode: "0000",
            onSuccess: ()=>Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )),
            onError: () {},
          ),
        ),
        (route) => false,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Text(
          "WELCOME",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
