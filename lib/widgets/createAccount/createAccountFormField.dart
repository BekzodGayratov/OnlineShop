import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/show_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CreateAccountFormField extends StatelessWidget {
  const CreateAccountFormField({
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: "Name",
                hintText: "John Doe"),
            validator: (v) {
              if (v!.isEmpty) {
                return "Bo'sh kiritish mumkin emas";
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.03,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                hintText: "example@gamil.com"),
            validator: (v) {
              if (v!.isEmpty) {
                return "Bo'sh kiritish mumkin emas";
              } else if (!v.contains("@")) {
                return "To'g'ri email kiriting";
              }
            },
          ),
          TextFormField(
            controller: _emailPasswordController,
            obscureText: context
                .watch<ShowPasswordProvider>()
                .show,
            decoration: InputDecoration(
              prefixIcon:
                  const Icon(Icons.lock_outline),
              labelText: "Password",
              suffix: TextButton(
                child: Text(
                  "Show",
                  style: TextStyle(
                      color:
                          ConstantsColors.themeColor),
                ),
                onPressed: () {
                  context
                      .read<ShowPasswordProvider>()
                      .showPassword();
                },
              ),
            ),
            validator: (v) {
              if (v!.isEmpty) {
                return "Bo'sh kiritish mumkin emas";
              }
            },
          ),
        ],
      ),
    );
  }
}
