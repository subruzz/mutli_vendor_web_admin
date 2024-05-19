import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _category =
        FirebaseFirestore.instance.collection('banners').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _category,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Expanded(
          child: GridView.builder(
            itemCount: snapshot.data!.size,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              final categoryData = snapshot.data!.docs[index];
              return Image.network(
                categoryData['image'],
                width: 150,
                fit: BoxFit.cover,
                height: 100,
              );
            },
          ),
        );
      },
    );
  }
}