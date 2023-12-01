import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackerkernel/models/product.dart';
import 'package:hackerkernel/screens/cstm_txt_field.dart';
import 'package:hackerkernel/screens/homepage.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CstmTxtField(
                controller: nameController,
                hintText: "Enter Product Name",
              ),
              CstmTxtField(
                controller: priceController,
                hintText: "Enter Product Price",
              ),
              const SizedBox(
                height: 10,
              ),
              pickedImage != null
                  ? Image.file(
                      File(pickedImage!.path),
                      height: 100,
                    )
                  : IconButton(
                      onPressed: () {
                        picker
                            .pickImage(source: ImageSource.gallery)
                            .then((value) {
                          pickedImage = value;
                          setState(() {});
                        });
                      },
                      icon: const Icon(
                        Icons.add_photo_alternate,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (pickedImage != null) {
                      streamController.add(Product(
                          id: 0,
                          productName: nameController.text,
                          price: priceController.text,
                          image: pickedImage!.path));
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(msg: "Please select image");
                    }
                  },
                  child: const Text("Add Product"))
            ],
          ),
        ),
      ),
    );
  }
}
