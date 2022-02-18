import 'package:app/providers/search_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

InkWell disableSearchField(BuildContext context) {
    return InkWell(
      child: TextFormField(
        controller: context.watch<SearchBarProvider>().searchController,
        decoration: InputDecoration(
          enabled: false,
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.height * 0.4),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/searching');
      },
    );
  }

