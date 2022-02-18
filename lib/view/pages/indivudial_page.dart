import 'package:app/constants/constants_colors.dart';
import 'package:flutter/material.dart';

class IndivudialPage extends StatelessWidget {
  var data;
  IndivudialPage({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ConstantsColors.iconThemeColor),
      ),
      body: Center(child: Text(data.toString())),
    );
  }
}
