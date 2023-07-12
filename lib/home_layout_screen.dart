import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_cart/MostRecentProducts/most_recent_prod_list.dart';
import 'package:smart_cart/Cart/cart_screen.dart';
import 'package:smart_cart/Categories/categories.dart';
import 'package:smart_cart/AUTH/widgets/log_out.dart';
import 'package:smart_cart/Reusable_Components/Reusable_FormField.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final discountBanners = [
    'assets/Deals/D1.jpg',
    'assets/Deals/D2.jpg',
    'assets/Deals/D3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Hello , User Name.'),
                        SizedBox(
                          height: 15,
                        ),
                        Text('UserEmail@Example.com'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.home),
                            SizedBox(
                              width: 50,
                            ),
                            Text('Home Page'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 50,
                            ),
                            Text('My Account'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.shopping_bag),
                            SizedBox(
                              width: 50,
                            ),
                            Text('My Orders'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.category),
                            SizedBox(
                              width: 50,
                            ),
                            Text('Categories'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(
                              width: 50,
                            ),
                            Text('Favorite'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.settings),
                            SizedBox(
                              width: 50,
                            ),
                            Text('Settings'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.question_mark_outlined),
                            SizedBox(
                              width: 50,
                            ),
                            Text('About'),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        LogOut(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            const Center(
              child: Text('Smart Cart'),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Icon(Icons.search),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              child: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Deals',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CarouselSlider.builder(
                itemCount: discountBanners.length,
                itemBuilder: (context, index, realIndex) {
                  final discountBanner = discountBanners[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 250,
                    child: Image.asset(
                      discountBanner,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  reverse: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            const CategoriesList(),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Most Recent',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            const MRProducts(),
            //------------------------------------
            // Column(
            //   children: [
            //     GridView.builder(
            //       shrinkWrap: true,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3,
            //       ),
            //       itemBuilder: (BuildContext context, int index) {
            //         return const Column(
            //           children: [
            //             Icon(
            //               Icons.abc_outlined,
            //               size: 50,
            //             ),
            //             Text('data'),
            //           ],
            //         );
            //       },
            //       itemCount: 25,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
