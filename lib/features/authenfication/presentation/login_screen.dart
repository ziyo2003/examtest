import 'package:examtest/features/authenfication/presentation/pages/homepage.dart';
import 'package:examtest/features/authenfication/presentation/widgets/devider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examtest/features/authenfication/presentation/bloc/auth_bloc.dart';
import 'package:examtest/features/authenfication/presentation/widgets/signup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131524),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 112),
            Center(
              child: SvgPicture.asset(
                'assets/loginScreen/loginscreen.svg',
                width: 72,
                height: 72,
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
            style: TextStyle(color: Colors.white),
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade500,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                  });
                },
              ),
        ),
      ),

            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, primary: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      LoginButtonPressed(
                        email: emailController.text,
                        password: passwordController.text,
                        succsess: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                                (route) => false,
                          );
                        },
                        failure: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Xatolik yuz berdi"),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: WDivider()),
                Gap(6),
                Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(5),
                Expanded(child: WDivider()),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF272C38),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 48,
                  width: 62,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/loginScreen/facebook.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF272C38),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 48,
                  width: 62,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/loginScreen/google.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF272C38),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 48,
                  width: 62,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/loginScreen/apple.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text("SignUp"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
