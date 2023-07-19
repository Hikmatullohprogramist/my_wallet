// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:my_wallet/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:my_wallet/pages/add/add.dart';
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

  bool isSelected_1 = false;
  bool isSelected_2 = false;
  bool isSelected_3 = false;

  void ontTapped1() {
    setState(() {
      isSelected_1 = true;
      isSelected_2 = false;
      isSelected_3 = false;
    });
  }

  void ontTapped2() {
    setState(() {
      isSelected_1 = false;
      isSelected_2 = true;
      isSelected_3 = false;
    });
  }

  void ontTapped3() {
    setState(() {
      isSelected_1 = false;
      isSelected_2 = false;
      isSelected_3 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<KirimChiqimModel> kirimChiqimModel = [
      KirimChiqimModel("Kirim", "", "Sistema", 50000),
      KirimChiqimModel("", "Chiqim", "Abed", 15000),
      KirimChiqimModel("", "Chiqim", "Yol kira", 3000),
      KirimChiqimModel("Kirim", " ", "Dasturdan", 50000),
      KirimChiqimModel("Kirim", "", "Ishdan", 500000),
      KirimChiqimModel("", "Chiqim", "Klaviaturaga", 300000),
      KirimChiqimModel("", "Chiqim", "Monitorga", 2500000),
    ];

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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
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
                          " Account",
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
                      cardName: "Chontak",
                      balance: 252.300,
                      cardNumber: 9862,
                      color: Colors.deepPurple[400],
                      expariedMonth: 14,
                      expariedYear: 25,
                    ),
                    MyCard(
                      cardName: "Plastik humo",
                      balance: 954.300,
                      cardNumber: 9862,
                      color: Colors.orange[400],
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
                count: 2,
                effect: SwapEffect(
                  activeDotColor: Colors.grey.shade800,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        ontTapped1();
                      },
                      child: CategoriesButton(
                        imgPath: "lib/icons/down-arrows_9847410.png",
                        text: "Kirim",
                        color: isSelected_1
                            ? const Color(0xff9E23FF)
                            : const Color(0xfff1ededff),
                      ),
                    ),
                    InkWell(
                      onTap: () => ontTapped2(),
                      child: CategoriesButton(
                        imgPath: "lib/icons/arrows-up_7019171.png",
                        text: "Chiqim",
                        color: isSelected_2
                            ? const Color(0xff9E23FF)
                            : const Color(0xfff1ededff),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ontTapped3();
                      },
                      child: CategoriesButton(
                        imgPath: "lib/icons/bill.png",
                        text: "Hisobot",
                        color: isSelected_3
                            ? const Color(0xff9E23FF)
                            : const Color(0xfff1ededff),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView.builder(
                  itemCount: kirimChiqimModel.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    var item = kirimChiqimModel[index];
                    return MyListTile(
                      iconPath: item.kirim.isEmpty
                          ? "lib/icons/arrows-up_7019171.png"
                          : "lib/icons/down-arrows_9847410.png",
                      title:
                          "${item.kirim.isEmpty ? item.chiqim : item.kirim}: ${item.title}",
                      subtitle: item.summa,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
