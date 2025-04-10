import 'package:flutter/material.dart';
import 'package:foodspot/ui/colors.dart';
import 'package:foodspot/ui/screens/home/menu_list.dart';

const List<String> images = [
  'assets/images/torta-plate.jpeg',
  'assets/images/taco-plate.jpeg',
  'assets/images/burritos.jpeg',
];

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkRed,
        title: Row(
          spacing: 5,
          children: [
            Spacer(),
            Icon(Icons.person, color: Colors.white.withValues(alpha: 0.75)),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(5.0),
                child: SizedBox(
                  height: 200,
                  child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withValues(alpha: 0.95),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lalocura",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(child: Container(color: Colors.black, child: MenuList())),
          ],
        ),
      ),
    );
  }
}
