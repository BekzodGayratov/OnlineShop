import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/show_password_provider.dart';
import 'package:app/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButtonField extends StatelessWidget {
  const LoginButtonField({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController emailPasswordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _emailPasswordController = emailPasswordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _emailPasswordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.07,
                bottom: MediaQuery.of(context).size.height * 0.01),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ConstantsColors.themeColor,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: ConstantsColors.themeColorSecond),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _emailController.text;
                    _emailPasswordController.text;
                    //! Data bazaga yubor
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  }
                },
              ),
            ),
          ),
          TextButton(
              child: const Text("Create account"),
              onPressed: () {
                Navigator.pushNamed(context, "/createAccount");
              })
        ],
      ),
    );
  }
}
