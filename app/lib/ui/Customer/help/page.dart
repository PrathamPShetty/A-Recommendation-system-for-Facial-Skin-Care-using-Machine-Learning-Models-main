import 'package:farm_link_ai/consts/assets.dart' as consts;
import 'package:flutter/material.dart';
import 'package:farm_link_ai/ui/commons/nav_bar/NavBar.dart';

class Help extends StatelessWidget {
  const Help({super.key});

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
                      image: AssetImage(consts.img26),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  child: Text(
                    'Skin Care Recommendations',
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

            // Help Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question 1
                  _buildQuestionAnswer(
                    '1. What is the minimum intake of water for skin hydration and glow?',
                    'Minimum 2 to 3 liters per day for men and women (which includes buttermilk, tender coconut water, and any sorts of liquids). '
                        'Or you can calculate using the following formula: 30ml per kg of body weight. For example, if your body weight is 65kg: '
                        '65 x 30 = ~2 liters.',
                  ),
                  const SizedBox(height: 24),

                  // Question 2
                  _buildQuestionAnswer(
                    '2. Which type of food can we consume early in the morning for glowing skin (like juice)?',
                    'Three-colored veggie juices provide the best nutrients for glowing skin. Some examples include:\n'
                        '● Carrot + Beetroot + Mint leaves\n'
                        '● Cucumber + Spinach + Ginger juice\n'
                        '● Tomato + Beetroot juice + 1 tsp flax seeds\n'
                        '● Cucumber + Carrot + Mint leaves + Lemon\n'
                        'You can add ginger, lemon, mint leaves, or any herbs of your choice for flavor.',
                  ),
                  const SizedBox(height: 24),

                  // Question 3
                  _buildQuestionAnswer(
                    '3. What foods are rich in antioxidants that benefit skin health?',
                    'Adding a diet with a variety of fruits and veggies in multiple colors helps to get a good amount of antioxidants. Rich foods include:\n'
                        'Berries, Grapes, Mango, Beets, Green tea, Carrot, Spinach.',
                  ),
                  const SizedBox(height: 24),

                  // Question 4
                  _buildQuestionAnswer(
                    '4. How does Vitamin C contribute to skin brightness?',
                    'By inhibiting melanin production, Vitamin C helps fade dark spots and hyperpigmentation. It also helps brighten the skin\'s appearance.',
                  ),
                  const SizedBox(height: 24),

                  // Question 5
                  _buildQuestionAnswer(
                    '5. Which healthy fats help keep the skin moisturized from within?',
                    'Omega-3 fatty acids and nuts are packed with omega-3 fatty acids, vitamins A, B, and E, and monounsaturated fats.',
                  ),
                  const SizedBox(height: 24),

                  // Question 6
                  _buildQuestionAnswer(
                    '6. What is the main food that causes acne and pimples?',
                    'Sugary and refined foods (processed foods) are the main culprits for acne and pimples.',
                  ),
                  const SizedBox(height: 24),

                  // Question 7
                  _buildQuestionAnswer(
                    '7. Will food impact dark circles?',
                    'Yes. Iron or Vitamin B12, E, D, and K deficiencies can cause dark circles. A balanced diet rich in essential nutrients helps reduce dark circles.',
                  ),
                  const SizedBox(height: 24),

                  // Question 8
                  _buildQuestionAnswer(
                    '8. Why is it essential to include leafy greens in a diet for clear and glowing skin?',
                    'Leafy greens support collagen synthesis. Foods like dark leafy greens, citrus fruits, tomatoes, and fatty fish are rich in vitamins and nutrients that support collagen production.',
                  ),
                  const SizedBox(height: 24),

                  // Question 9
                  _buildQuestionAnswer(
                    '9. Will food impact pigmentation?',
                    '100% yes. A healthy balanced diet is the secret to radiant, glowing, spot-free skin.',
                  ),
                  const SizedBox(height: 24),

                  // Question 10
                  _buildQuestionAnswer(
                    '10. What are the main nutrients we need to consume for healthy skin?',
                    'Foods rich in Vitamin E, zinc, selenium, omega-3 fatty acids, and antioxidant-rich foods are essential for healthy skin.',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionAnswer(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF404A3D),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
