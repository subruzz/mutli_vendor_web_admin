import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:mutli_vendor_admin/controllers/image_provider.dart';
import 'package:mutli_vendor_admin/controllers/side_bar_controller.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      sideBar: SideBar(
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        onSelected: (item) {

          Provider.of<SideBarProvider>(context, listen: false)
              .changeScreen(item.route ?? '');
        },
        items: const [
          AdminMenuItem(
              title: 'DASHBOARD', icon: Icons.dashboard, route: '/dashboard'),
          AdminMenuItem(
              title: 'VENDORS',
              icon: CupertinoIcons.person_3,
              route: '/vendors'),
          AdminMenuItem(
              title: 'WITHDRAWAL',
              icon: CupertinoIcons.money_dollar,
              route: '/withdrawal'),
          AdminMenuItem(
              title: 'ORDERS',
              icon: CupertinoIcons.shopping_cart,
              route: '/orders'),
          AdminMenuItem(
              title: 'CATEGORIES', icon: Icons.category, route: '/categories'),
          AdminMenuItem(
              title: 'PRODUCTS', icon: Icons.shop, route: '/products'),
          AdminMenuItem(
              title: 'UPLOAD BANNERS',
              icon: Icons.image,
              route: '/upload_banners'),
        ],
        selectedRoute: '_currentRoute',
      ),
      body: Consumer<SideBarProvider>(
        builder: (context, value, child) {
          return value.currentScreen;
        },
      ),
    );
  }
}
