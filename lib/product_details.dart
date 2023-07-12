import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:smart_cart/Reusable_Components/Reusable_Button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    this.ProductDetailName,
    this.ProductDetailPhoto,
    this.ProductDetailCurrentPrice,
    this.ProductDetailOldPrice,
  });

  final ProductDetailName;

  final ProductDetailPhoto;

  final ProductDetailCurrentPrice;

  final ProductDetailOldPrice;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _qtyCurrentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Center(
                      child: Image.asset(
                        widget.ProductDetailPhoto,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                  child: Text(
                                    widget.ProductDetailName,
                                    style: const TextStyle(fontSize: 27),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.ProductDetailCurrentPrice,
                                        style: const TextStyle(fontSize: 27),
                                      ),
                                      const Text(
                                        '\$',
                                        style: TextStyle(fontSize: 27),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    // color: Colors.pink,
                                    child: Text(
                                        'Product Details Description .......... '),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                                child: Text('Available Sizes : '),
                              ),
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          if (kDebugMode) {
                                            print('Size Chosen');
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.black26,
                                          ),
                                          height: 30,
                                          width: 30,
                                          child: const Center(
                                            child: Text('Size'),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          final newValue = _qtyCurrentValue - 1;
                          _qtyCurrentValue = newValue.clamp(0, 100);
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: NumberPicker(
                        value: _qtyCurrentValue,
                        minValue: 0,
                        maxValue: 100,
                        onChanged: (value) =>
                            setState(() => _qtyCurrentValue = value),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          final newValue = _qtyCurrentValue + 1;
                          _qtyCurrentValue = newValue.clamp(0, 100);
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ReusableButton(
                buttonWidth: double.infinity,
                buttonText: 'Add To Cart',
                buttonBackgroundColor: Colors.green,
                buttonOnPressed: () {
                  if (kDebugMode) {
                    print('Add To Cart');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
