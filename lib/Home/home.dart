import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> products = const [
    {
      'title': 'Наушники Beats by Dre',
      'price': '400,000 ₩',
      'image': 'images/mysic.jpg',
      'description': 'Эти наушники — верный спутник в мире звука и стиля. С их элегантным дизайном и превосходным качеством звучания вы погружаетесь в музыкальный опыт нового уровня.',
      'seller': 'Иван иванович',
      'star': "(20)",
    },
    {
      'title': 'Очки Prada',
      'price': '80,000 ₩ - Договорная ',
      'image': 'images/ochki.jpg',
      'description': 'Это потресающие очки',
      'seller': 'Иван Иванович',
      'star': "(20)",
    },
    {
      'title': 'Наушники Beats by Dre',
      'price': '400,000 ₩',
      'image': 'images/mysic.jpg',
      'description': 'Описание наушников...',
      'seller': 'Иван иванович',
      'star': "(20)",
    },
    {
      'title': 'Очки Prada',
      'price': '80,000 ₩ - Договорная ',
      'image': 'images/ochki.jpg',
      'description': 'Это потресающие очки',
      'seller': 'Иван Иванович',
      'star': "(20)",
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.location_on, color: Colors.white, size: 25),
            ),
            const SizedBox(width: 10),
            const Text("Ваш город : ",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 16)),
            const Text("Сеул",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                )),
            const Spacer(),
            const Icon(Icons.notifications_none, color: Colors.white, size: 28),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Введите название товара',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: const Color.fromARGB(255, 58, 58, 58),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
              ),
            ),
          ),
          SizedBox(
            height: 180,
            child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() => _currentPage = page);
              },
              children: [
                _buildBanner(const Color.fromARGB(255, 255, 0, 0), "Реклама", "здесь могла быть\nваша реклама", imagePath: "images/renem.jpg"),
                _buildBanner(Colors.green, "Но ее", "здесь нет"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(2, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 60 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.deepOrangeAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text("Категории", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(width: 300),
                GestureDetector(
                  onTap: () {},
                  child: const Text("Показать все", style: TextStyle(color: Colors.red, fontSize: 15)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _buildCategory('images/cofta.png', "Одежда"),
                const SizedBox(width: 20),
                _buildCategory('images/house.png', "Недвижимость"),
                const SizedBox(width: 20),
                _buildCategory('images/phone.png', "Электроника"),
                const SizedBox(width: 20),
                _buildCategory('images/chto.png', "Все для дома"),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Рекомендации", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) {
                final item = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          title: item['title']!,
                          desc: item['description']!,
                          star: item['star']!,
                          imageUrl: item['image']!,
                          seller: item['seller']!,
                          price: item['price']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorBuilder: (context, error, stackTrace) => const Center(
                                      child: Icon(Icons.broken_image, color: Colors.white54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                                  child: const Icon(Icons.favorite_border, color: Colors.white, size: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['price']!.split('-')[0],
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text("Алматы", style: TextStyle(color: Colors.red, fontSize: 12)),
                              const Text("Сегодня, 15:30", style: TextStyle(color: Colors.white54, fontSize: 11)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
Widget _buildBanner(Color color, String title, String subtitle, {String? imagePath}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 180, 
        color: color,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, 
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(subtitle, 
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            if (imagePath != null)
              Positioned(
                right: 15,  
                bottom: -20, 
                top: 15,
                child: Image.asset(
                  imagePath,
                  width: 200, 
                  height: 200,
                  fit: BoxFit.cover, 
                  color: color.withOpacity(0.5), 
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
  Widget _buildCategory(String img, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundImage: AssetImage(img),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String title, desc, price, imageUrl, seller, star;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.desc,
    required this.star,
    required this.imageUrl,
    required this.seller,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 350,
                    color: Colors.transparent,
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.white54, size: 50),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(Icons.download, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(price, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  const Text("Договорная", style: TextStyle(color: Colors.red, fontSize: 15)),
                  const SizedBox(height: 25),
                  const Text("Описание товара", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      desc,
                      style: const TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Продавец", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('images/Ivan.jpg'),
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(seller, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Color.fromARGB(255, 255, 81, 0), size: 18),
                                  const SizedBox(width: 5),
                                  Text("Отзывы $star", style: const TextStyle(color: Colors.white70, fontSize: 14)),
                                  const Spacer(),
                                  const Icon(Icons.chevron_right, color: Colors.white54),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () {},
              child: const Text("Связаться с продавцом", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                foregroundColor: Colors.red,
              ),
              onPressed: () {},
              label: const Text("Пожаловаться", style: TextStyle(fontSize: 14, color: Colors.red)),
              icon: const Icon(Icons.report_problem_outlined, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}