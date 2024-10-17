import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/bazar/bazar_screen.dart';
import 'package:turath/features/cart/cart_screen.dart';
import 'package:turath/features/civilization/civilization_screen.dart';
import 'package:turath/features/community/community.dart';
import 'package:turath/features/figures/figures_screen.dart';
import 'package:turath/features/search/search_screen.dart';
import 'package:turath/features/profile/profile_screen.dart';
import 'package:turath/features/wars/wars_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [
    Product(
        Assets.imagesTempleTombStructureFromAncientEgypt232151611694,
        'Civilizations',
        const Icon(Icons.castle_rounded, size: 40, color: Color(0xffEDE4DD))),
    Product(
        Assets.imagesViewAncientTempleTombFromAncientEgyptianTimes232151611729,
        'Figures',
        const Icon(Icons.colorize_rounded, size: 40, color: Color(0xffEDE4DD))),
    Product(Assets.imagesWars, 'Wars',
        const Icon(Icons.shield_rounded, size: 40, color: Color(0xffEDE4DD))),
    Product(
        Assets
            .images3dRenderedPhotoAncientBooksAdornLibraryCarefullyArrangedWithClassics115803023026,
        'Books Bazaar',
        const Icon(Icons.book_rounded, size: 40, color: Color(0xffEDE4DD))),
  ];

  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      // محتوى الصفحة الرئيسية
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: ListTile(
              title: Text(
                "Hello, Enjoy day",
                style: TextStyle(
                    color: Color(0xffEDE4DD),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Let's Go",
                style: TextStyle(color: Color(0xffEDE4DD), fontSize: 16),
              ),
              trailing: Icon(
                Icons.location_on_outlined,
                size: 38,
                color: Color(0xffEDE4DD),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 600, // تكبير الارتفاع
              width: 400, // تكبير العرض
              child: ScrollSnapList(
                itemBuilder: (context, index) => _buildListItem(context, index),
                itemCount: productList.length,
                itemSize: 300, // زيادة حجم العنصر
                onItemFocus: (index) {
                  // تنفيذ ما تريده عند تركيز العنصر
                },
                dynamicItemSize: true,
              ),
            ),
          ),
        ],
      ),
       Cart(),
      Searchscreen(), // صفحة البروفايل

      const communityscreen(), // صفحة البروفايل

      const ProfileScreen(), // صفحة البروفايل

// صفحة البروفايل
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c1c),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: ResponsiveNavigationBar(
        selectedIndex: _selectedIndex,
        onTabChange: changeTab,
        textStyle: const TextStyle(
          color: Color(0xffEDE4DD),
          fontWeight: FontWeight.bold,
        ),
        navigationBarButtons: const <NavigationBarButton>[
          NavigationBarButton(
            text: 'Home',
            icon: Icons.home,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFFC8876B), Colors.black],
            ),
          ),
          NavigationBarButton(
            text: 'My Cart',
            icon: Icons.shopping_cart,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFFC8876B), Colors.black],
            ),
          ),
          NavigationBarButton(
            text: 'Search',
            icon: Icons.search,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFFC8876B), Colors.black],
            ),
          ),
          NavigationBarButton(
            text: 'Community',
            icon: Icons.people_alt,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFFC8876B), Colors.black],
            ),
          ),
          NavigationBarButton(
            text: 'Profile',
            icon: Icons.account_circle_rounded,
            backgroundGradient: LinearGradient(
              colors: [Color(0xFFC8876B), Colors.black],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    // Product product = productList[index];
    return InkWell(
      onTap: () {
        if (index == 0) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CivilizationScreen()));
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FiguresScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WarsScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  BazaarPage()),
          );
        }
      },
      child: SizedBox(
        width: 300,
        height: 400,
        child: Card(
          elevation: 15,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: const Color(0xff1c1c1c),
                image: DecorationImage(
                  image: AssetImage(productList[index].imagePath),
                  fit: BoxFit.cover,
                  opacity: 0.75,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250),
                  Text(
                    productList[index].title,
                    style: const TextStyle(
                        color: Color(0xffEDE4DD),
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    child: productList[index].description,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String imagePath;
  final String title;
  final Icon description;

  Product(this.imagePath, this.title, this.description);
}
