import 'package:flutter/material.dart';
import 'package:smart_cart/Categories/category_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Icon(Icons.arrow_back_ios),
            CategoryItem(
              category_image_location: 'assets/Categories/bikes.jpg',
              category_name: 'Bikes',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/clothes.jpg',
              category_name: 'clothes',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/computers.jpg',
              category_name: 'computers',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/gamingConsoles.jpg',
              category_name: 'Gaming',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/glasses.jpg',
              category_name: 'Glasses',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/mobiles.jpg',
              category_name: 'Mobiles',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/padel.jpg',
              category_name: 'Padel',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/tv.jpg',
              category_name: 'TVs',
            ),
            CategoryItem(
              category_image_location: 'assets/Categories/watches.jpg',
              category_name: 'Watches',
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
