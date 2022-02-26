import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wpay/ui/screens/auth/sign_in/sign_in_controller.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (controller) {
        return  Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text("Sign In View")
          ),
        );
      },
    );
  }
}
