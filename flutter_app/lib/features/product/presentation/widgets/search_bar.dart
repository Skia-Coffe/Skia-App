import 'package:flutter/material.dart';
import 'package:skia_coffee/core/constants/consts.dart';
// import 'package:skia_coffee/features/customizeBlend/data/datasources/product_data_source.dart';
// import 'package:skia_coffee/features/recommedations/presentation/widgets/coffee_card.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

//To do search bar
class _SearchBarWidgetState extends State<SearchBarWidget> {
  // TextEditingController _searchController = TextEditingController();
  // String _searchText = '';
  // List<CoffeeCard> _mainList = ProductsData().items;
  // List<CoffeeCard> _displayList = List.from(ProductsData().items);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Container(
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: textColor,
            style: const TextStyle(color: textColor),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
              hintText: "Search in Orders",
              hintStyle: TextStyle(color: Colors.black12),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
