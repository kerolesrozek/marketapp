// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:fruitesapp/core/consts.dart';
// import 'package:fruitesapp/features/home/presentation/views/home_view.dart';

// class CusttomButtomNavigationBar extends StatefulWidget {
//   const CusttomButtomNavigationBar({super.key});

//   @override
//   State<CusttomButtomNavigationBar> createState() =>
//       _CusttomButtomNavigationBarState();
// }

// class _CusttomButtomNavigationBarState
//     extends State<CusttomButtomNavigationBar> {
//   List<Widget> screens = [
//     HomeView(),
//     Text('productus'),
//     Text('cart'),
//     Text('profile'),
//   ];
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (value) {
//         setState(() {
//           currentIndex = value;
//         });
//         log(currentIndex.toString());
//       },
//       selectedItemColor: Color(kBasicColor.value),
//       backgroundColor: Colors.white,
//       type: BottomNavigationBarType.fixed,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'الصفحة الرئيسية',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.category),
//           label: 'المنتجات',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart),
//           label: 'سله التسوق',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'حسابي',
//         ),
//       ],
//     );
//   }
// }
