import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/add_basket_and_like_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndivudialPage extends StatelessWidget {
  var data;
  IndivudialPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddToBasketProvider(),
        builder: (context, child) {
          return Scaffold(
            backgroundColor: ConstantsColors.lightModeColor,
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: context.watch<AddToBasketProvider>().isFavorited
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_outline),
                    onPressed: () {
                      context.read<AddToBasketProvider>().favorited();
                    })
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
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.0))),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.035),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[0],
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.01),
                              child: Text(
                                "Colors",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 0.7),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            radius: 10.0,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
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
                                    ),
                                  );
                                },
                                itemCount: 3,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  bottom: MediaQuery.of(context).size.height *
                                      0.01),
                              child: Text("Get Apple TV-free for a year",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Text(
                              "Available when you purchaise any new iPhone. iPod Touch Mac or Apple TV. \#4.99/month after free trial.",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                  letterSpacing: 0.5, color: Colors.grey),
                            ),
                            TextButton(
                              child: Row(
                                children: [
                                  Text(
                                    "Full description",
                                    style: TextStyle(
                                        color: ConstantsColors.themeColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: ConstantsColors.themeColor,
                                  )
                                ],
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            color:
                                                ConstantsColors.iconThemeColor),
                                      ),
                                      Text(
                                        "\$579",
                                        style: TextStyle(
                                            color: ConstantsColors.themeColor,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      child: const Text("Add to basket"),
                                      style: ElevatedButton.styleFrom(
                                          primary: ConstantsColors.themeColor),
                                      onPressed: () {
                                        context
                                            .read<AddToBasketProvider>()
                                            .addToBasket(data[0]);
                                        print("Items has added");
                                      },
                                    ),
                                  )
                                ],
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
        });
  }
}
