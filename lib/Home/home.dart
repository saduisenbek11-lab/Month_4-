import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  final List<Map<String, String>> products =  [
    {
      'title': 'Наушники',
      'price': '400,000 ₩ - Договорная ',
      'image': 'https://picsum.photos/seed/item0/200/200',
      'description': 'Эти наушники - верный спутник в мире звука и стиля.C их элегантным дизайном и превосходным качеством звучания вы погружаетесь в музыкальный опыт нового уровня .',
      'seller': 'Fashion Seoul Store',
    },
    {
      'title': 'Зимние кроссовки',
      'price': '89,000 ₩',
      'image': 'https://picsum.photos/seed/item1/200/200',
      'description': 'Теплые кроссовки с меховой подкладкой. Нескользящая подошва обеспечит безопасность на льду.',
      'seller': 'СпортМастер Ким',
    },
    {
      'title': 'Наручные часы',
      'price': '120,000 ₩',
      'image': 'https://picsum.photos/seed/item2/200/200',
      'description': 'Классические кварцевые часы. Водонепроницаемый корпус и ремешок из натуральной кожи.',
      'seller': 'Luxury Watch',
    },
    {
      'title': 'Худи Oversize',
      'price': '35,000 ₩',
      'image': 'https://picsum.photos/seed/item3/200/200',
      'description': 'Мягкий хлопок премиум-качества. Свободный крой, который не сковывает движения.',
      'seller': 'Street Wear Co.',
    },
    {
      'title': 'Рюкзак городской',
      'price': '55,000 ₩',
      'image': 'https://picsum.photos/seed/item4/200/200',
      'description': 'Вместительный рюкзак с отделением для ноутбука до 15.6 дюймов. Влагозащитный материал.',
      'seller': 'Bag Pack Official',
    },
    {
      'title': 'Солнцезащитные очки',
      'price': '25,000 ₩',
      'image': 'https://picsum.photos/seed/item5/200/200',
      'description': 'Очки с защитой от ультрафиолета UV400. Стильная оправа, подходящая под любой тип лица.',
      'seller': 'Sun Glasses Boutique',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            const Text("Ваш город : ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 17)),
            const Text("Сеул",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 2.0,
                )),
            const Spacer(),
            const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Введите название товара',
                hintStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: const Color.fromARGB(255, 58, 58, 58),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 20, left: 15, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Реклама",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text("Здесь могла быть",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                  Text("ваша реклама",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Категории",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () => {

                      },
                      child: const Text("Показать все",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            decorationThickness: 2.0,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/Rubashka.jpg')),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/Rubashka.jpg')),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/Rubashka.jpg')),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/Rubashka.jpg')),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/Rubashka.jpg')),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Рекомендации",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                          title: item['title']!,
                          desc: item['description']!, 
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Stack( 
                             children: [
                               ClipRRect(
                              
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                child: Image.network(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                 height: 200,
                                ),
                              ),
                              Positioned(
                              top: 8,
                              right: 8, 
                              child:Container(
                            decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                            ),
                              child: const Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 255, 255, 255),
                               size: 20,   
                            )
                              )
                              )
                             ]
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['price']!,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
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
        ],
      ),
    );
  }
}


class ProductDetailPage extends StatelessWidget {
  final String title, desc,price, imageUrl, seller;
  
  ProductDetailPage({
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.seller,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                   
                    child: Row(
                      children: [
                        Text("$title", 
                          style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Text("$price", style: const TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text("Описание товара:", 
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(desc, 
                    style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5)),
                ],
                
              ),
            ),
             Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person, color: Colors.red),
                        const SizedBox(width: 10),
                        Text("Продавец: $seller", 
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              );
          },
          child: const Text("Связаться с продавцом", style: TextStyle(color: Colors.white)),
        ),
      ),
        );
  }
}