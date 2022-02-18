import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/show_password_provider.dart';
import 'package:app/widgets/loginPageWidgets/form_field.dart';
import 'package:app/widgets/loginPageWidgets/login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _emailPasswordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider<ShowPasswordProvider>(
      create: (context) => ShowPasswordProvider(),
      builder: (context, child) => Scaffold(
        body: FadeInRight(
          child: Stack(
            children: [
              Container(
                color: ConstantsColors.themeColor,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.02),
                      child: const Text(
                        "Welcome \nback",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.73,
                      decoration: BoxDecoration(
                          color: ConstantsColors.themeColorSecond,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10.0))),
                      child: Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.07,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            LoginFormFieldWidget(
                                formKey: _formKey,
                                emailController: _emailController,
                                emailPasswordController:
                                    _emailPasswordController),
                            LoginButtonField(formKey: _formKey, emailController: _emailController, emailPasswordController: _emailPasswordController)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

