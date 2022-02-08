import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'screens/explorepage.dart';
import 'screens/searchpage.dart';
import 'screens/cartpage.dart';
import 'screens/profilepage.dart';
import 'package:provider/provider.dart';
import 'modals/product_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CartProduct(),
      child: MaterialApp(
        title: 'E Commerce App',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = const[
    ExplorePage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];
  late PageController _pageController;
  int _selectedpageindex=0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  void _onchangeBottomBar(int index){
    setState(() {
      _selectedpageindex=index;
      _pageController.jumpToPage(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: pages,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            _selectedpageindex=index;
          });
        }
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0))
        ),
        child: Container(
          child: FluidNavBar(
            style: FluidNavBarStyle(
              iconBackgroundColor: Colors.black12,
              barBackgroundColor: Colors.transparent,
              iconUnselectedForegroundColor: Colors.grey.shade100,
              iconSelectedForegroundColor: Colors.black

            ),

            icons: [
              FluidNavBarIcon(icon: Icons.home,extras: {'label':'home'}),
              FluidNavBarIcon(icon: Icons.search,extras: {'label':'search'}),
              FluidNavBarIcon(icon: Icons.shopping_cart,extras: {'label':'cart'}),
              FluidNavBarIcon(icon: Icons.person_outline_rounded,extras: {'label':'profile'})
            ],
            onChange: _onchangeBottomBar,
          ),
        ),
      ),
    );
  }
}
