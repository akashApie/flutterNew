import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      title: 'Login Page', color: Colors.cyan, home: Login()));
}

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => LoginPage();
}

class LoginPage extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool hide = true;
  passwordHide() {
    setState(() {
      print(hide);
      hide = !hide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.cyan[200],
        ),
        body: Align(
            alignment: Alignment.center,
            child: Container(
                width: 500,
                child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: TextFormField(
                              controller: userNameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Input empty';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Input empty';
                                } else if (!value.contains('@')) {
                                  return 'Incorrect format';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: hide,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      passwordHide();
                                    },
                                    child: Icon(hide
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Input empty';
                                } else if (regex.hasMatch(value)) {
                                  return 'Incorrect format';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Form submitted')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Invalid form')));
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          )
                        ],
                      ),
                    )))));
  }
}
