import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hermes/app/modulos/home/home_page.dart';
import 'package:hermes/app/widgets/entry_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(body: screenWidth < 500 ? mobileLayout() : webLayout());
  }

  Widget mobileLayout() {
    return const LoginForm(marginValue: 50);
  }

  Widget webLayout() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.redAccent,
          ),
        ),
        Container(
          width: 400,
          margin: const EdgeInsets.all(10),
          child: const LoginForm(marginValue: 20),
        )
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.marginValue});

  final double marginValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginValue),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EntryWidget(
            hintText: 'Usuario',
            isPassword: false,
          ),
          const SizedBox(
            height: 30,
          ),
          const EntryWidget(
            hintText: 'password',
            isPassword: true,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () => loginEvent(context), child: const Text('Login'))
        ],
      ),
    );
  }

  loginEvent(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
