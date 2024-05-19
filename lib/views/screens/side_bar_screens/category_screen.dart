import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:mutli_vendor_admin/controllers/Image_provider.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/widgets/category_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<CategoryScreen> {
  String categoryName = '';
  void uploadCategory() {
    if (!_formKey.currentState!.validate()) return;
    final imgProvider = Provider.of<ImgProvider>(context, listen: false);
    uploadToFirestorage(imgProvider.selectedImage, imgProvider.fileName);
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<String> _uploadBanner(dynamic image, String fileName) async {
    Reference ref = _storage.ref().child('categoryImages ').child(fileName);
    UploadTask task = ref.putData(image);
    TaskSnapshot snapshot = await task;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void uploadToFirestorage(Uint8List? image, String? fileName) async {
    EasyLoading.show(status: 'loading...');
    if (image == null) return;
    final downloadUrl = await _uploadBanner(image, fileName!);
    _fireStore
        .collection('categories')
        .doc(fileName)
        .set({'categoryName': categoryName, 'image': downloadUrl});
    Provider.of<ImgProvider>(context, listen: false).clearImage();
    EasyLoading.dismiss();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Consumer<ImgProvider>(
                        builder: (ctx, value, child) {
                          return Center(
                            child: value.selectedImage == null
                                ? TextButton(
                                    onPressed: value.selecteImage,
                                    child: const Text('Select a image'),
                                  )
                                : Image.memory(
                                    value.selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder()),
                      onPressed: () {
                        uploadCategory();
                      },
                      child: const Text('Upload Image'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  onChanged: (value) => categoryName = value,
                  decoration: const InputDecoration(
                    label: Text('Enter category'),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please Enter Category Name' : null,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder()),
                onPressed: () {},
                child: const Text('save  Image'),
              ),
            ],
          ),
          const CategoryWidget(),
        ],
      ),
    );
  }
}
