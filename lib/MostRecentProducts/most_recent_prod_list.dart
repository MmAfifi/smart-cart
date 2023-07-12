import 'package:flutter/material.dart';

import 'product_item.dart';

class MRProducts extends StatefulWidget {
  const MRProducts({super.key});

  @override
  State<MRProducts> createState() => _MRProductsState();
}

class _MRProductsState extends State<MRProducts> {
  var product_list = [
    {
      'name': 'Test Product 1',
      'photo': 'assets/Dummy_Products/prod1.jpg',
      'old_price': '100',
      'current_price': '85',
    },
    {
      'name': 'Test Product 2',
      'photo': 'assets/Dummy_Products/prod2.jpg',
      'old_price': '200',
      'current_price': '150',
    },
    {
      'name': 'Test Product 3',
      'photo': 'assets/Dummy_Products/prod3.jpg',
      'old_price': '300',
      'current_price': '200',
    },
    {
      'name': 'Test Product 4',
      'photo': 'assets/Dummy_Products/prod4.jpg',
      'old_price': '600',
      'current_price': '450',
    },
    {
      'name': 'Test Product 5',
      'photo': 'assets/Dummy_Products/prod5.jpg',
      'old_price': '1000',
      'current_price': '850',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            prod_name: product_list[index]['name'],
            prod_photo: product_list[index]['photo'],
            prod_old_price: product_list[index]['old_price'],
            prod_current_price: product_list[index]['current_price'],
          );
        },
        itemCount: product_list.length,
      ),
    );
  }
}
