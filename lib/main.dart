import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mutli_vendor_admin/controllers/Image_provider.dart';
import 'package:mutli_vendor_admin/controllers/side_bar_controller.dart';
import 'package:mutli_vendor_admin/firebase_options.dart';
import 'package:mutli_vendor_admin/views/screens/main_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/category_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/orders_screens.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/produts_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:mutli_vendor_admin/views/screens/side_bar_screens/withdrawal_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SideBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImgProvider(),
        )
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        routes: {
          '/': (context) => const MainScreen(),
          '/dashboard': (context) => const DashBoardScreen(),
          '/vendors': (context) => const VendorsScreen(),
          '/withdrawal': (context) => const WithdrawalScreen(),
          '/orders': (context) => const OrdersScreen(),
          '/categories': (context) => const CategoryScreen(),
          '/products': (context) => const ProductsScreen(),
          '/upload_banners': (context) => const UploadBannerScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
