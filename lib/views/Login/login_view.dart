import 'package:flutter/material.dart';
import 'package:notes_app/views/Login/widgets/custom_from_text_field.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'email',
                  icon: const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'password',
                  icon: const Icon(Icons.lock),
                  isPassword: true,
                ),
                // CustomButton(
                //     onTap: () async {
                //       if (formKey.currentState!.validate()) {
                //         BlocProvider.of<AuthCubit>(context)
                //             .loginUser(email: email!, password: password!);
                //       } else {}
                //     },
                //     text: 'LOGIN',
                //   ),
              ],
            )),
      ),
    );
  }
}
