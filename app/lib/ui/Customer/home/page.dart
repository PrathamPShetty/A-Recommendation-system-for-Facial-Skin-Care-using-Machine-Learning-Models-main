import 'package:flutter/material.dart';
import 'package:farm_link_ai/ui/commons/nav_bar/NavBar.dart';
import 'package:farm_link_ai/consts/assets.dart' as consts;
import 'package:farm_link_ai/consts/homePageService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return NavBar(
      bodyContent: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 450,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(consts.img28),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Natural Skin Care, Made with Love',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "100% Organic Ingredients",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(width: 50),
                        Text(
                          "Crafted With Care",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore our range of skin care products made from natural, organic ingredients. Each product is crafted with care to nourish your skin.",
                  style: const TextStyle(color: Colors.grey, height: 1.4),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                const Text(
                  "Organic Skin Care Products",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Our skin care products are free from harmful chemicals and are designed to nourish your skin with the purest ingredients.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _makeProduct(consts.img3),
                      _makeProduct(consts.img5),
                      _makeProduct(consts.img8),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Handcrafted Home-Made Products",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "From soaps to candles, all of our home-made products are crafted with love and care to bring warmth and comfort to your home.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _makeProduct(consts.img18),
                      _makeProduct(consts.img11),
                      _makeProduct(consts.img13),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeProduct(String image) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
