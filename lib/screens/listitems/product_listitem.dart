import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackerkernel/models/product.dart';
import 'package:hackerkernel/screens/homepage.dart';

class ProductListItem extends StatefulWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(
                    widget.product.image,
                  ),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${widget.product.price}",
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
              onPressed: () {
                products.remove(widget.product);
                setState(() {});
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        )
      ],
    );
  }
}
