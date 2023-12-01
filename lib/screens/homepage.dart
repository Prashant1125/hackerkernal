import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackerkernel/models/product.dart';
import 'package:hackerkernel/screens/add_product.dart';
import 'package:hackerkernel/screens/listitems/product_listitem.dart';

List<Product> products = [];
List<Product> accessories = [];

StreamController<Product> streamController = StreamController<Product>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription? streamSubscription;
  Stream<Product> stream = streamController.stream;

  @override
  void initState() {
    streamSubscription = stream.listen((event) {
      products.add(event);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addProduct,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        leading: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.search,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          const Text(
            "Hi-Fi Shop & Service",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Audio shop on Rustaveli Ave 57,",
            style: TextStyle(
              fontSize: 14, color: Colors.grey,
              // fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "This shop offers both products and services",
            style: TextStyle(
              fontSize: 14, color: Colors.grey,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Header(
            title: "Products",
            count: products.length,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) => ProductListItem(
                      product: products[index],
                    )),
          ),
          const Header(
            title: "Accessories",
            count: 3,
          ),
          SizedBox(
            height: 220,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                width: 150,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/ear.jfif",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Earphones",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "\$300",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/head.jfif",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Headphones",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "\$999",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/oculus.jfif",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Oculus Headset",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "\$34999",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void addProduct() {
    showModalBottomSheet(context: context, builder: (context) => AddProduct());
  }
}

class Header extends StatelessWidget {
  final String title;
  final int count;
  const Header({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              " $count",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Show all"),
        ),
      ],
    );
  }
}
