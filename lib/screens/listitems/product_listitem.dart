import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackerkernel/models/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(
            File(
              product.image,
            ),
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.productName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$ ${product.price}",
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
