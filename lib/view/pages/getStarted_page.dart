import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/view/pages/login_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUpBig(
        child: Stack(
          children: [
            Container(
              color: ConstantsColors.themeColor,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                children: [
                  const AutoSizeText(
                    "Find your \nGadget",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.48,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset("assets/getstarted.png"),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.4,
                        child: Image.asset("assets/suffix.png"),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ConstantsColors.themeColorSecond,
                        ),
                        child: Text(
                          "Get started",
                          style: TextStyle(color: ConstantsColors.themeColor),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
