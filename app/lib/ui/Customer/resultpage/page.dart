import 'package:flutter/material.dart';
import 'package:farm_link_ai/consts/assets.dart' as img;
import 'package:url_launcher/url_launcher.dart';
final Map<String, Map<String, dynamic>> remediesData = {
  "Dry": {
    "home_products": [
      {
        "remedy_name": "Honey and Milk Cleanser",
        "ingredients": [
          "2 tablespoons raw milk",
          "1 teaspoon honey"
        ],
        "instructions": [
          "Mix the milk and honey.",
          "Apply the mixture to your face using a cotton pad.",
          "Rinse with lukewarm water after 10 minutes."
        ],
        "benefits": "Gently cleanses the skin while providing hydration and nourishment."
      },
      {
        "remedy_name": "Avocado and Yogurt Mask",
        "ingredients": [
          "1 ripe avocado",
          "1 tablespoon plain yogurt"
        ],
        "instructions": [
          "Mash the avocado and mix it with yogurt.",
          "Apply the mixture to your face and leave it on for 15 minutes.",
          "Rinse off with warm water."
        ],
        "benefits": "Deeply nourishes and moisturizes dry skin."
      }
    ],
    "tips": [
      "Drink plenty of water throughout the day to stay hydrated.",
      "Avoid harsh soaps and cleansers; use ones with hydrating ingredients.",
      "Incorporate foods rich in omega-3 fatty acids like salmon and walnuts into your diet.",
      "Moisturize: Apply moisturizer frequently, especially after washing your hands or bathing while your skin is still damp. Use an ointment or cream instead of a lotion, as they are more effective and less irritating."
    ],
    "products": [
      {
        "name": "Honey and Olive Oil Mask",
        "image": img.img16,
        "description": "A moisturizing mask that hydrates dry skin using honey and olive oil, leaving it soft and nourished.",
"link":"https://www.dotandkey.com/products/dot-key-ceramides-hyaluronic-hydrating-face-cream-i-repairs-skin-barrier-intense-moisturization-sensitive-dry-skin-fragrance-free?srsltid=AfmBOopqfySxfrZuf7w4NFhOOo_X7lKl6Frhcufo3WOQBhGb0eSMe9_MZ_w"
      },
      {
        "name": "Aloe Vera Gel",
        "image": img.img17,
        "description": "Fresh aloe vera gel that soothes and hydrates dry skin, providing a refreshing and calming effect.",
        "link":"https://www.dotandkey.com/products/dot-key-ceramides-hyaluronic-hydrating-face-cream-i-repairs-skin-barrier-intense-moisturization-sensitive-dry-skin-fragrance-free?srsltid=AfmBOopqfySxfrZuf7w4NFhOOo_X7lKl6Frhcufo3WOQBhGb0eSMe9_MZ_w"

      },
      {
        "name": "CeraVe Hydrating Facial Cleanser",
        "image": img.img12,
        "description": "A hydrating cleanser suitable for dry skin. Helps to restore the skin's moisture barrier.",
        "link":"https://www.dotandkey.com/products/dot-key-ceramides-hyaluronic-hydrating-face-cream-i-repairs-skin-barrier-intense-moisturization-sensitive-dry-skin-fragrance-free?srsltid=AfmBOopqfySxfrZuf7w4NFhOOo_X7lKl6Frhcufo3WOQBhGb0eSMe9_MZ_w"

      },
      {
        "name": "Eucerin Advanced Repair Lotion",
        "image": img.img14,
        "description": "A rich moisturizer designed to relieve dry, rough skin.",
        "link":"https://www.dotandkey.com/products/dot-key-ceramides-hyaluronic-hydrating-face-cream-i-repairs-skin-barrier-intense-moisturization-sensitive-dry-skin-fragrance-free?srsltid=AfmBOopqfySxfrZuf7w4NFhOOo_X7lKl6Frhcufo3WOQBhGb0eSMe9_MZ_w"

      },

    ]
  },
  "Normal": {
    "home_products": [
      {
        "remedy_name": "Aloe Vera Moisturizer",
        "ingredients": [
          "1 tablespoon aloe vera gel"
        ],
        "instructions": [
          "Extract fresh aloe vera gel.",
          "Apply it gently to your face and let it absorb.",
          "No need to rinse unless it feels sticky."
        ],
        "benefits": "Hydrates and soothes skin, maintaining its natural balance."
      },
      {
        "remedy_name": "Cucumber Face Pack",
        "ingredients": [
          "1/2 cucumber",
          "1 tablespoon honey"
        ],
        "instructions": [
          "Blend the cucumber and mix it with honey.",
          "Apply the mixture to your face for 15 minutes.",
          "Rinse with cool water."
        ],
        "benefits": "Refreshes and hydrates the skin."
      }
    ],
    "tips": [
      "Maintain a balanced diet with plenty of fruits and vegetables.",
      "Use sunscreen daily to protect your skin from UV damage.",
      "Cleanse your skin gently twice a day to remove dirt and oil."
    ],
    "products": [
      {
        "name": "Cucumber and Yogurt Mask",
        "image":  img.img18,
        "description": "A hydrating and refreshing mask made with cucumber and yogurt, perfect for normal skin.",
        "link":"https://www.myntra.com/massage-oils/joy/joy-honey--almonds-nourishing-body-oil-with-vitamin-e--sunscreen---200-ml/18426344/buy"
      },
      {
        "name": "Rose Water Toner",
        "image":  img.img19,
        "description": "A gentle toner that balances the skin's pH and refreshes the skin with rose water.",
        "link": "https://www.myntra.com/massage-oils/joy/joy-honey--almonds-nourishing-body-oil-with-vitamin-e--sunscreen---200-ml/18426344/buy"
      },
      {
        "name": "Honey and Olive Oil Mask",
        "image":  img.img20,
        "description": "A moisturizing mask that hydrates dry skin using honey and olive oil, leaving it soft and nourished.",
        "link":"https://www.myntra.com/massage-oils/joy/joy-honey--almonds-nourishing-body-oil-with-vitamin-e--sunscreen---200-ml/18426344/buy"
      },
      {
        "name": "Aloe Vera Gel",
        "image":  img.img21,
        "description": "Fresh aloe vera gel that soothes and hydrates dry skin, providing a refreshing and calming effect.",
        "link":"https://www.myntra.com/massage-oils/joy/joy-honey--almonds-nourishing-body-oil-with-vitamin-e--sunscreen---200-ml/18426344/buy"
      }
    ]
  },
  "Oil": {
    "home_products": [
      {
        "remedy_name": "Lemon and Honey Mask",
        "ingredients": [
          "1 teaspoon lemon juice",
          "1 teaspoon honey"
        ],
        "instructions": [
          "Mix the lemon juice and honey.",
          "Apply the mixture to your face, avoiding the eye area.",
          "Rinse with warm water after 10-15 minutes."
        ],
        "benefits": "Helps control oil and reduces acne while keeping skin hydrated."
      },
      {
        "remedy_name": "Green Tea and Mint Face Pack",
        "ingredients": [
          "1 tablespoon green tea powder",
          "1 tablespoon fresh mint leaves",
          "1 tablespoon honey"
        ],
        "instructions": [
          "Crush the mint leaves and mix them with green tea powder and honey.",
          "Apply to your face for 10 minutes.",
          "Rinse with cool water."
        ],
        "benefits": "Controls oil and fights acne with anti-inflammatory properties."
      }
    ],
    "tips": [
      "Avoid heavy, oil-based moisturizers; opt for lightweight, non-comedogenic ones.",
      "Blot your face with oil-absorbing sheets during the day to control shine.",
      "Incorporate foods rich in zinc and vitamin A to help regulate oil production."
    ],
    "products": [
      {
        "name": "Lemon and Honey Face Pack",
        "image":  img.img22,
        "description": "A mask that helps control excess oil with the natural astringent properties of lemon and honey.",
        "link":"https://beminimalist.co/products/marula-05-moisturizer?currency=INR&variant=41476371480737&utm_source=google&utm_medium=cpc&utm_campaign=Google%20Shopping&stkn=f4faea6d89b6&srsltid=AfmBOoox4t-je7iJzXNoWU2DbcFRb8Q6B5LpxJkB0zRkdvwNJBt6rST_5yk"
      },
      {
        "name": "Aloe Vera and Tea Tree Oil Mask",
        "image":  img.img23,
        "description": "A mask with aloe vera and tea tree oil that fights acne and controls oil production while hydrating the skin.",
        "link":"https://beminimalist.co/products/marula-05-moisturizer?currency=INR&variant=41476371480737&utm_source=google&utm_medium=cpc&utm_campaign=Google%20Shopping&stkn=f4faea6d89b6&srsltid=AfmBOoox4t-je7iJzXNoWU2DbcFRb8Q6B5LpxJkB0zRkdvwNJBt6rST_5yk"

      },
      {
        "name": "Neutrogena Hydro Boost Water Gel",
        "image": img.img13,
        "description": "A gel-based moisturizer that provides intense hydration without feeling greasy.",
        "link":"https://beminimalist.co/products/marula-05-moisturizer?currency=INR&variant=41476371480737&utm_source=google&utm_medium=cpc&utm_campaign=Google%20Shopping&stkn=f4faea6d89b6&srsltid=AfmBOoox4t-je7iJzXNoWU2DbcFRb8Q6B5LpxJkB0zRkdvwNJBt6rST_5yk"

      },
      {
        "name": "Clinique Moisture Surge 72-Hour Auto-Replenishing Hydrator",
        "image": img.img15,
        "description": "An oil-free moisturizer that helps skin retain moisture for up to 72 hours.",
        "link":"https://beminimalist.co/products/marula-05-moisturizer?currency=INR&variant=41476371480737&utm_source=google&utm_medium=cpc&utm_campaign=Google%20Shopping&stkn=f4faea6d89b6&srsltid=AfmBOoox4t-je7iJzXNoWU2DbcFRb8Q6B5LpxJkB0zRkdvwNJBt6rST_5yk"

      }
    ]
  }
};

class ResultPage extends StatelessWidget {
  final String skinType;
  final String acneType;

  const ResultPage({
    Key? key,
    required this.skinType,
    required this.acneType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = remediesData[skinType] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skin Type: $skinType',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Acne Type: $acneType',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text(
                'Home Remedies:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (data["home_products"] != null)
                ...List.generate(
                  data["home_products"].length,
                      (index) {
                    final remedy = data["home_products"][index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              remedy["remedy_name"] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Ingredients: ${remedy["ingredients"].join(", ")}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Instructions: ${remedy["instructions"].join(" ")}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Benefits: ${remedy["benefits"]}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 16),
              const Text(
                'Tips:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (data["tips"] != null)
                ...List.generate(
                  data["tips"].length,
                      (index) {
                    return Text(
                      '• ${data["tips"][index]}',
                      style: const TextStyle(fontSize: 14),
                    );
                  },
                ),
              const SizedBox(height: 16),
              const Text(
                'Recommended Products:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (data["products"] != null)
                ...List.generate(
                  data["products"].length,
                      (index) {
                    final product = data["products"][index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      elevation: 5,
                      child: GestureDetector(
                        onTap: () => _launchURL(product["link"] ?? ''),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product["name"] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Image.asset(product["image"] ?? ''),
                            const SizedBox(height: 8),
                            Text(
                              product["description"] ?? '',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
void _launchURL(String url) async {
  try {
    final encodedUrl = Uri.encodeFull(url); // Encode the URL
    if (await canLaunch(encodedUrl)) {
      await launchUrl(encodedUrl as Uri);
    } else {
      debugPrint('Could not launch $encodedUrl');
    }
  } catch (e) {
    debugPrint('Error launching URL: $e');
  }
}
