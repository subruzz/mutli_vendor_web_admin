import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/category_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/orders_screens.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/produts_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/withdrawal_screen.dart';

class SideBarProvider extends ChangeNotifier {
  Widget _currentScreen = const DashBoardScreen();
  Widget get currentScreen => _currentScreen;
  void changeScreen(String route) {
    switch (route) {
      case '/dashboard':
        _currentScreen = const DashBoardScreen();

        break;
      case '/vendors':
        _currentScreen = const VendorsScreen();

        break;
      case '/withdrawal':
        _currentScreen = const WithdrawalScreen();

        break;
      case '/orders':
        _currentScreen = const OrdersScreen();

        break;
      case '/categories':
        _currentScreen = const CategoryScreen();

        break;
      case '/products':
        _currentScreen = const ProductsScreen();

        break;
      case '/upload_banners':
        _currentScreen = const UploadBannerScreen();

        break;
      default:
        _currentScreen = const DashBoardScreen();
    }
    notifyListeners();
  }
}
