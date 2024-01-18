import 'package:coffee_ui/const/list.dart';
import 'package:coffee_ui/utils/coffee_tile.dart';
import 'package:coffee_ui/utils/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222222),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 25,
        backgroundColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff1B1A1D),
                Color(0xff212121),
                Color(0xff111111),
                Color(0xff222222),
              ],
            ),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Find the best coffee for you",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      hintText: "Find your coffee..",
                      focusedBorder: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      coffeeItems.length,
                      (index) => listCoffee(
                        title: coffeeItems[index],
                        index: index,
                        isSelected: index == selectedIndex,
                        onPressed: () {
                          setState(
                            () {
                              selectedIndex = index;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CoffeeTile(
                        title: 'Latte',
                        detail: 'With Almond Milk',
                        price: '\$4.00',
                        image: 'lib/images/c1.jpg',
                      ),
                      CoffeeTile(
                        title: 'Cappuccino',
                        detail: 'With Steamed Milk',
                        price: '\$6.00',
                        image: 'lib/images/c3.jpg',
                      ),
                      CoffeeTile(
                        title: 'Americano',
                        detail: 'With Bicotti',
                        price: '\$3.00',
                        image: 'lib/images/c2.jpg',
                      ),
                      CoffeeTile(
                        title: 'Expresso',
                        detail: 'With Dark Chocolate',
                        price: '\$8.00',
                        image: 'lib/images/c4.jpg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
