import 'package:farm_link_ai/consts/assets.dart' as consts;
import 'package:flutter/material.dart';
import 'package:farm_link_ai/ui/commons/nav_bar/NavBar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return NavBar(
      bodyContent: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Stack(
              children: [
                Container(
                  height: isSmallScreen ? 200 : 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(consts.img25),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  child: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // About Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Who We Are',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF404A3D),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    ' Whether you’re looking for hydration, anti-aging, or soothing relief, our range of skin care products are designed to rejuvenate your skin and promote a healthy, radiant glow.',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // Services Section
            Container(
              color: Color(0xFFF8F8F8),
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Our Skin Care Services',
                      style: TextStyle(
                        fontSize: isSmallScreen ? 22 : 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF404A3D),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isSmallScreen ? 1 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      // Skin care services content
                      return _buildServiceCard(
                        consts.img28,
                        'Service ${index + 1}',
                        'Our homemade products are a testament to the love and passion we put into every creation. Made with the finest natural ingredients, each product is handcrafted to ensure the highest quality and freshness. From artisanal soaps to homemade candles, our products offer a unique and personal touch that you won’t find in mass-produced items..',
                      );
                    },
                  ),
                ],
              ),
            ),

            // Gallery Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Gallery',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 22 : 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF404A3D),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: isSmallScreen ? 2 : 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildGalleryImage(consts.img26),
                      _buildGalleryImage(consts.img29),
                      _buildGalleryImage(consts.img30),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String iconPath, String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(iconPath, width: 50, height: 50),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF404A3D),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
