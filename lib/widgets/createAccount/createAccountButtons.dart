import 'package:app/constants/constants_colors.dart';
import 'package:app/view/screens/home_page.dart';
import 'package:flutter/material.dart';

class CreateAccountButtonField extends StatelessWidget {
  const CreateAccountButtonField({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController emailPasswordController,
  }) : _formKey = formKey, _nameController = nameController, _emailController = emailController, _emailPasswordController = emailPasswordController, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _emailPasswordController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top:
              MediaQuery.of(context).size.height * 0.07,
        ),
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height * 0.07,
          width:
              MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ConstantsColors.themeColor,
            ),
            child: Text(
              "Create Account",
              style: TextStyle(
                  color:
                      ConstantsColors.themeColorSecond),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _nameController.text;
                _emailController.text;
                _emailPasswordController.text;
                //! Data bazaga yubor
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage()),
                    (route) => false);
              }
            },
          ),
        ),
      ),
    );
  }
}