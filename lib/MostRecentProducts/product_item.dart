import 'package:flutter/material.dart';
import 'package:smart_cart/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.prod_name,
    this.prod_photo,
    this.prod_old_price,
    this.prod_current_price,
  });

  final prod_name;
  final prod_photo;
  final prod_old_price;
  final prod_current_price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  new ProductDetails(
                        ProductDetailName: prod_name,
                        ProductDetailPhoto: prod_photo,
                        ProductDetailCurrentPrice: prod_current_price,
                        ProductDetailOldPrice: prod_old_price,
                      ),),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    height: 115,
                    width: 170,
                    child: Image.asset(
                      prod_photo,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(prod_name),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$prod_current_price\$',
                          style: const TextStyle(
                              color: Colors.green, fontSize: 20),
                        ),
                        const Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '$prod_old_price\$',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // GridTile(
      //   // header: Center(
      //   //   child: Text(
      //   //     '$prod_current_price \$',
      //   //     style: const TextStyle(color: Colors.green, fontSize: 30),
      //   //   ),
      //   // ),
      //   header: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         Icon(
      //           Icons.favorite,
      //           color: Colors.grey[300],
      //         ),
      //       ],
      //     ),
      //   ),
      //   footer: GridTileBar(
      //     title: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           prod_name,
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontSize: 15,
      //             fontWeight: FontWeight.bold,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //         Expanded(
      //           child: Row(
      //             children: [
      //               Text(
      //                 '$prod_current_price\$',
      //                 style: const TextStyle(
      //                   color: Colors.green,
      //                   fontSize: 25,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 textAlign: TextAlign.center,
      //               ),
      //               const Expanded(
      //                 child: SizedBox(),
      //               ),
      //               Text(
      //                 '$prod_old_price\$',
      //                 style: const TextStyle(
      //                   decoration: TextDecoration.lineThrough,
      //                   color: Colors.red,
      //                   fontSize: 22,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 textAlign: TextAlign.center,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     backgroundColor: Colors.black26,
      //     // leading: IconButton(
      //     //   onPressed: () {
      //     //     if (kDebugMode) {
      //     //       print('$prod_name added to favorites');
      //     //     }
      //     //   },
      //     //   icon: const Icon(Icons.favorite),
      //     // ),
      //   ),
      //   child: GestureDetector(
      //     onTap: () {
      //       if (kDebugMode) {
      //         print('$prod_name details page');
      //       }
      //       // Navigator.of(context).push(MaterialPageRoute(
      //       //   builder: (context) => const ProductDetailsScreen(),),);
      //     },
      //     child: Image.asset(
      //       prod_photo,
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
    );
  }
}
