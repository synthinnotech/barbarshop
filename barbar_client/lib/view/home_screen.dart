import 'package:barbar_client/controller/app_controller.dart';
import 'package:barbar_client/controller/theme_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title(String val) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          val,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Barbars'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
          SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 10),
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [],
                  ),
                  clipBehavior: Clip.hardEdge,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Image.asset(
                    width: double.infinity,
                    height: 180,
                    'assets/images/booking.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              options: CarouselOptions(
                  height: 180, viewportFraction: 1.0, autoPlay: true),
            ),
            SizedBox(height: 10),
            title('Top Rated persons'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 5),
                  for (var i = 0; i < 10; i++)
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: ThemeController.baseColor,
                      ),
                    ),
                  SizedBox(width: 5),
                ],
              ),
            ),
            title('BarbarShops'),
            for (var b = 0; b < 15; b++)
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeController.baseColor.withAlpha(30),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeController.baseColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mani barbars',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('address')
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          icon: Icon(TablerIcons.heart),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ThemeController.baseColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, size: 15, color: Colors.yellow),
                              SizedBox(width: 4),
                              Text(
                                '5%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
