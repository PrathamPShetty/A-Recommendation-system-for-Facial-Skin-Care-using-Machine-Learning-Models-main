import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:farm_link_ai/consts/assets.dart' as consts;

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.bodyContent,
    this.title = 'AI Skin Care Recommendation System',
  });

  final Widget bodyContent;
  final String title;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeUserType();
  }

  Future<void> _initializeUserType() async {
    // Simulating a delay for demonstration.
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false; // Assume loading is complete
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF000000)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF5ECCED),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(consts.navbarImage),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF404A3D),
                    ),
                  ),
                ],
              ),
            ),
            if (!isLoading) ..._MenuItems(context),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : widget.bodyContent,
    );
  }

  List<Widget> _MenuItems(BuildContext context) {
    return [
      _drawerItem(context, Icons.home, 'Home', '/'),
      _drawerItem(context, Icons.info, 'About Us', '/about'),
      _drawerItem(context, Icons.contact_phone, 'Contact', '/contact'),
      _drawerItem(context, Icons.recommend, 'AI Recommendation', '/recommendation'),
      _drawerItem(context, Icons.shopping_cart, 'Product', '/product'),
      _drawerItem(context, Icons.help, 'Help', '/help'),
      _drawerItem(context, Icons.settings, 'Setting', '/setting'),
    ];
  }

  Widget _drawerItem(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF404A3D)),
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF404A3D)),
      ),
      onTap: () {
        context.go(route); // Navigate to the specified route.
      },
    );
  }
}
