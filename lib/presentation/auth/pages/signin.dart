import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/common/bloc/button/button_state.dart';
import 'package:flutter_login/common/bloc/button/button_state_cubit.dart';
import 'package:flutter_login/data/models/signIn_request_params.dart';
import 'package:flutter_login/domain/usecases/signIn.dart';
import 'package:flutter_login/presentation/auth/service_locator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0B192C),
        body: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {}
              if (state is ButtonFailedState) {
                var snackBar = SnackBar(content: Text(state.errorMessage));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      child: const Text("Recipe App",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: email,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: TextField(
                        obscureText: !visible,
                        controller: password,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                icon: visible
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      )
                                    : const Icon(Icons.visibility_off,
                                        color: Colors.white)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          TextButton(
                              onPressed: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //   return RegisterScreen();
                                // }));
                              },
                              child: const Text("Register here",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )))
                        ],
                      ),
                    ),
                    buttonSign(context)
                  ],
                ),
              )),
            ),
          ),
        ));
  }

  Widget buttonSign(BuildContext context) {
    return Builder(builder: (context) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(45),
              backgroundColor: Colors.blue),
          onPressed: () {
            context.read<ButtonStateCubit>().excute(
                usecase: sl<SignInUseCase>(),
                params: SigninRequestParams(
                    username: email.text, password: password.text));
          },
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ));
    });
  }
}
