 import 'package:app/providers/search_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

itemFoundStatus(BuildContext context) {
    if (context.watch<SearchBarProvider>().searchedItems.isEmpty) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 12,
            child: Image.asset("assets/notFound.png"),
          ),
          const Text(
            "Item not found",
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: const Text(
              "Try a more generic search term or try looking for alternative products.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      );
    } else {
      return null;
    }
  }

