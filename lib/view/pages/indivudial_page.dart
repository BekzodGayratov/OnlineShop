import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:flutter/material.dart';

class IndivudialPage extends StatelessWidget {
  var data;
  IndivudialPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsColors.lightModeColor,
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.favorite_outline), onPressed: () {})
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ConstantsColors.iconThemeColor),
      ),
      body: FadeInUp(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: PageView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      "https://source.unsplash.com/random/$index",
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.0))),
                child: Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.035),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2020 Apple iPad Air asd10.9\"",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        child: Text(
                          "Colors",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black,width: 0.7),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.02),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        radius: 10.0,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Text(
                                        "Sky Blue",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ));
                          },
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
