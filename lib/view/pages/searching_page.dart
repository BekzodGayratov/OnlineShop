import 'package:animate_do/animate_do.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/search_bar_provider.dart';
import 'package:app/widgets/searching_widget.dart';
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
            title: SearchingButton(),
          ),
          body: FadeInUp(
            child: Column(children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        width: 20,
                        height: 20,
                        
                      );
                    },itemCount: context.watch<SearchBarProvider>().searchedItems.length),
              ),
            ]),
          ),
        );
      },
    );
  }
}
