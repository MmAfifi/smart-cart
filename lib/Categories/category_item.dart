import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category_image_location,
    required this.category_name,
  });

  final String category_image_location;
  final String category_name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: SizedBox(
          width: 100,
          child: ListTile(
            title: Image.asset(
              category_image_location,
              width: 150,
              height: 70,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                category_name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        onTap: () {
          if (kDebugMode) {
            print(category_name);
          }
        },
      ),
    );
  }
}
