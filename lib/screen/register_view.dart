import 'package:dashky_finance/utils/global.colors.dart';
import 'package:dashky_finance/widgets/button.global.dart';
import 'package:dashky_finance/widgets/social.login.dart';
import 'package:dashky_finance/widgets/text.form.global.dart';
import 'package:dashky_finance/screen/login_view.dart'; // Import halaman login
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // State untuk mengatur visibilitas password dan konfirmasi password
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.png', // Path gambar logo Anda
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Create your Account',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),

                // Email Input
                TextFormGlobal(
                  controller: emailController,
                  text: 'Username',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),

                // Password Input with Eye Icon
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !isPasswordVisible,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Kata Sandi',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
                      hintStyle: const TextStyle(fontSize: 14),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: GlobalColors.mainColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Confirm Password Input with Eye Icon
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: !isConfirmPasswordVisible,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Konfirmasi Kata Sandi',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
                      hintStyle: const TextStyle(fontSize: 14),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: GlobalColors.mainColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isConfirmPasswordVisible = !isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Tombol "Daftar" untuk navigasi ke LoginView
                Buttonglobal(
                  buttonText: 'Daftar',
                  onTap: () {
                    Get.to(() => const LoginView()); // Navigasi ke LoginView
                  },
                ),
                const SizedBox(height: 25),

                // Widget social login dengan teks "or sign up with"
                SocialLogin(isLogin: false),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sudah memiliki akun?"),
            InkWell(
              onTap: () {
                Get.to(() => const LoginView()); // Navigasi ke LoginView
              },
              child: Text(
                'Masuk',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
