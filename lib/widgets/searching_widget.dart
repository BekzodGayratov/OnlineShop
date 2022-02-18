import 'package:app/components/poductsComponents/products_components.dart';
import 'package:app/constants/constants_colors.dart';
import 'package:app/providers/search_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchingButton extends StatelessWidget {
  const SearchingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.watch<SearchBarProvider>().searchController,
      decoration: InputDecoration(
        focusColor: ConstantsColors.themeColor,
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height * 0.4),
            borderSide: BorderSide(color: ConstantsColors.themeColor)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height * 0.4),
        ),
      ),
      onChanged: (v) {
        for (var item in wearableNames) {
          if (v.isEmpty) {
            context.read<SearchBarProvider>().cleanSearchedItems();
          } else if (item.toLowerCase().contains(v.toLowerCase())) {
            context.read<SearchBarProvider>().addSearchedItems(item);
          }
        }
      },
    );
  }
}
