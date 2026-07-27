import 'package:flutter/material.dart';
import 'package:tail/components/index.dart';
import 'package:tail/pages/main_page.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool isLogin = false;
  // login
  final email = TextEditingController();
  final password = TextEditingController();

  // register
  final name = TextEditingController();
  final registerPassword = TextEditingController();
  final registerRePassword = TextEditingController();
  final registerEmail = TextEditingController();
  final workShopName = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  // TODO: Login Register Button Function
  void loginRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: ((context) => MainPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(top: 40, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/dark_logo.png", width: 30),
                    Text(
                      isLogin ? "Login Your Account." : "Create Your Account.",
                      style: TextStyle(
                        fontFamily: "monro",
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "start managing your tailoring business",
                      style: TextStyle(
                        // fontFamily: "monro",
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 80, left: 30, right: 30),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: isLogin
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: isLogin
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: isLogin ? 16 : 14,
                              color: isLogin
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: isLogin
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: isLogin
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: isLogin ? 14 : 16,
                              color: isLogin
                                  ? Theme.of(context).colorScheme.surface
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsetsGeometry.only(top: 20, left: 30, right: 30),
                child: Column(
                  children: [
                    if (isLogin) ...[
                      AppInputField(
                        label: 'Email Address',
                        hint: 'name@email.com',
                        icon: Icons.email_rounded,
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      AppInputField(
                        label: "Password",
                        hint: "***",
                        icon: Icons.lock_outline_rounded,
                        controller: password,
                        isPassword: true,
                      ),
                    ] else ...[
                      AppInputField(
                        label: 'Full Name',
                        hint: 'John doe',
                        icon: Icons.person,
                        controller: name,
                      ),
                      AppInputField(
                        label: 'Email Address',
                        hint: 'name@email.com',
                        icon: Icons.email_rounded,
                        controller: registerEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      AppInputField(
                        label: "Password",
                        hint: "***",
                        icon: Icons.lock_rounded,
                        controller: registerPassword,
                        isPassword: true,
                      ),
                      AppInputField(
                        label: "Re password",
                        hint: "***",
                        icon: Icons.password,
                        controller: registerRePassword,
                        isPassword: true,
                      ),
                      AppInputField(
                        label: "Work Shop Name",
                        hint: "tail house",
                        icon: Icons.shopping_bag,
                        controller: workShopName,
                      ),
                    ],
                  ],
                ),
              ),
              CustomBtn(
                text: isLogin ? "Login" : "Register",
                height: 58,
                onPressed: () {
                  loginRegister();
                },
                foregroundColor: Theme.of(context).colorScheme.tertiary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              DividerText(text: "or continue with"),

              Row(
                children: [
                  Expanded(
                    child: CustomBtn(
                      text: "Google",
                      icon: Icons.g_mobiledata,
                      height: 58,
                      onPressed: () {},
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  Expanded(
                    child: CustomBtn(
                      text: "Apple",
                      height: 58,
                      onPressed: () {},
                      foregroundColor: Theme.of(context).colorScheme.tertiary,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      icon: Icons.abc,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
