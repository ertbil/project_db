import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:project_db/components/custom_text_form_field.dart';
import 'package:project_db/repos/authenticated_user_repo.dart';
import 'package:project_db/services/data_service.dart';

import '../models/login.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Form(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "FriendYol",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    const Spacer(),
                    const Text('Giriş yap', style: TextStyle(fontSize: 30)),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      hintText: 'Name',
                      prefixIcon: const Icon(Icons.person),
                      controller: usernameController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      controller: passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Login login = Login(
                                    mail: usernameController.text,
                                    password: passwordController.text);

                                final result =
                                    ref.watch(dataServiceProvider).login(login);
                                result.then((value) {
                                  Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
                                  debugPrint(decodedToken.toString());
                                  final innerResult = ref.watch(dataServiceProvider).getUser(decodedToken['id']);
                                  innerResult.then((value) {
                                   ref.read(userProvider).setUser(value);
                                      Navigator.pushNamed(context, '/');
                                    });




                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));



                                });
                                result.catchError((error) {
                                  SnackBar(content: Text(error.toString()));
                                });

                              },
                              child: const Text('Login'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text('Register'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
