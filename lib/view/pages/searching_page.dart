import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/search_bar_provider.dart';
import 'package:app/widgets/searching_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchingPage extends StatelessWidget {
  const SearchingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBarProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            iconTheme: IconThemeData(color: ConstantsColors.iconThemeColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const SearchingButton(),
          ),
          body: FadeInUp(
            child: Column(children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.4),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                          vertical: MediaQuery.of(context).size.height * 0.04,
                        ),
                        child: FadeInUp(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.05),
                                color: Colors.red,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.13),
                                      child: Text("Apple",style: TextStyle(fontSize: 30.0),),
                                    ),
                                    Text("asdas")
                                  ],
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width *0.06,
                                bottom: MediaQuery.of(context).size.height * 0.15,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                              "https://source.unsplash.com/random/$index"))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: context
                        .watch<SearchBarProvider>()
                        .searchedItems
                        .length),
              ),
            ]),
          ),
        );
      },
    );
  }
}
