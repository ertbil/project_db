import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/components/drop_down_button.dart';

import '../components/custom_text_form_field.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final yearController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  var gender;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Form(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "FriendYol",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      const Center(
                        child:
                            Text('Kaydol', style: TextStyle(fontSize: 30)),
                      ),
                      CustomTextFormField(
                        hintText: 'Name',
                        prefixIcon: const Icon(Icons.person),
                        controller: usernameController,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        controller: passwordController,
                        isPassword: true,
                      ),
                      CustomTextFormField(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        controller: passwordController,
                        isPassword: true,
                      ),
                      CustomTextFormField(
                        hintText: "Doğum Yılı",
                        prefixIcon: const Icon(Icons.date_range),
                        controller: yearController,
                      ),
                      CustomTextFormField(
                        hintText: "Telefon",
                        prefixIcon: const Icon(Icons.phone),
                        controller: passwordController,
                      ),
                      CustomTextFormField(
                        hintText: "E-mail",
                        prefixIcon: const Icon(Icons.mail),
                      ),
                      CustomDropDownButton(
                        items: [],
                        hintText: "Cinsiyet",
                        onChanged: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text('Login'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Register'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
