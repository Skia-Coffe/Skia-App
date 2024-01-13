import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/core/constants/icons.dart';
import 'package:skia_coffee/features/favorites/presentation/pages/favorite_page.dart';
import 'package:skia_coffee/features/home/presentation/pages/home_page.dart';
import 'package:skia_coffee/features/product/presentation/pages/product_home_page.dart';
import 'package:skia_coffee/features/profile/presentation/pages/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  final int curHome;
  final String? name;

  const BottomNavigation({super.key, required this.curHome, this.name});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomeScreen(currentPage: widget.curHome, prod: widget.name),
      const ProductPage(),
      // const ProductDetailsPage(),
      const FavoritesPage(),
      const ProfilePage()
    ];
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icHome,
              color: _currentIndex == 0 ? textColor : iconColorUnselected,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icProduct,
              color: _currentIndex == 1 ? textColor : iconColorUnselected,
            ),
            label: 'Products',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icProfile,
              color: _currentIndex == 3 ? textColor : iconColorUnselected,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: textColor,
        unselectedItemColor: iconColorUnselected,
      ),
    );
  }
}
