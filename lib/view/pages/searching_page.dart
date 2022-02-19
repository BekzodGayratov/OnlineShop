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
          backgroundColor: ConstantsColors.lightModeColor,
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            iconTheme: IconThemeData(color: ConstantsColors.iconThemeColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const SearchingButton(),
          ),
          body: FadeInUp(
            child: Column(children: [
              Text(
                  "Found ${context.watch<SearchBarProvider>().searchedItems.length} results"),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.35),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: FadeInUp(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.08),
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.13,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.015,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.015),
                                      child: const Text(
                                        "Apple iPad",
                                        style: TextStyle(
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      "From \$600",
                                      style: TextStyle(
                                          color: ConstantsColors.themeColor,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
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
