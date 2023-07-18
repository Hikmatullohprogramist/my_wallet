import 'package:flutter/material.dart';
import 'package:my_wallet/utils/categories.dart';
import 'package:my_wallet/utils/my_card.dart';
import 'package:my_wallet/utils/my_list_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 200,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.pink[200],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                size: 32,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.monetization_on,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              //app bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "My",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          " Card",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyCard(
                      balance: 252.300,
                      cardNumber: 9862,
                      color: Colors.deepPurple[400],
                      expariedMonth: 14,
                      expariedYear: 25,
                    ),
                    MyCard(
                      balance: 954.300,
                      cardNumber: 9862,
                      color: Colors.orange[400],
                      expariedMonth: 14,
                      expariedYear: 25,
                    ),
                    MyCard(
                      balance: 954.300,
                      cardNumber: 9862,
                      color: Colors.orange[400],
                      expariedMonth: 14,
                      expariedYear: 25,
                    ),
                    MyCard(
                      balance: 1486.300,
                      cardNumber: 9862,
                      color: Colors.red[400],
                      expariedMonth: 14,
                      expariedYear: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect:
                    ExpandingDotsEffect(activeDotColor: Colors.grey.shade800),
              ),

              const SizedBox(
                height: 25,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesButton(
                        imgPath: "lib/icons/share.png", text: "Send"),
                    CategoriesButton(
                        imgPath: "lib/icons/wallet.png", text: "Pay"),
                    CategoriesButton(
                        imgPath: "lib/icons/bill.png", text: "Bills"),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    MyListTile(
                      iconPath: "lib/icons/analysis.png",
                      title: "Statistics",
                      subtitle: "Payments and Icome",
                    ),
                    MyListTile(
                      iconPath: "lib/icons/transaction.png",
                      title: "Transaction",
                      subtitle: "Transaction history",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
