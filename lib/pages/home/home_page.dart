// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/pages/add/add.dart';
import 'package:my_wallet/pages/add_card/add_card.dart';
import 'package:my_wallet/pages/home/home_view_model.dart';
import 'package:my_wallet/widgets/categories.dart';
import 'package:my_wallet/widgets/my_card.dart';
import 'package:my_wallet/widgets/my_list_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  HomeViewModel model = Get.put(HomeViewModel());

  bool isSelected_1 = false;
  bool isSelected_2 = false;
  bool isSelected_3 = false;

  void ontTapped1() {
    setState(() {
      isSelected_1 = true;
      isSelected_2 = false;
      isSelected_3 = false;
      model.getKirim();
    });
  }

  void ontTapped2() {
    setState(() {
      isSelected_1 = false;
      isSelected_2 = true;
      isSelected_3 = false;
      model.getChiqim();
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(),
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
                          "Hello",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          " Hikmatillo",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCard(),
                          )),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.add),
                      ),
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

              if (isSelected_1)
                SizedBox(
                  height: 500,
                  child: Obx(
                    () {
                      if (model.isLoading.value == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (model.isLoading.value == false) {
                        return Center(
                          child: ListWheelScrollView.useDelegate(
                            physics: const FixedExtentScrollPhysics(),
                            itemExtent: 90,
                            perspective: 0.002,
                            diameterRatio: 1.8,
                            offAxisFraction: -0,
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: model.kirimList.length,
                              builder: (context, index) {
                                var item = model.kirimList[index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: const DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          model.deleteKirim(item.id);
                                        },
                                        icon: Icons.delete,
                                        backgroundColor: Colors.red,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      SlidableAction(
                                        onPressed: (context) {},
                                        icon: Icons.edit,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ],
                                  ),
                                  child: MyListTile(
                                    iconPath:
                                        "lib/icons/down-arrows_9847410.png",
                                    title: " ${item.izoh}",
                                    subtitle: NumberFormat.currency(
                                      locale: "Uz-uz",
                                      decimalDigits: 0,
                                    ).format(int.parse(item.narx)).toString(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              if (isSelected_2)
                SizedBox(
                  height: 500,
                  child: Obx(
                    () {
                      if (model.isLoading.value == true) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (model.isLoading.value == false) {
                        return Center(
                          child: ListWheelScrollView.useDelegate(
                            physics: const FixedExtentScrollPhysics(),
                            itemExtent: 90,
                            perspective: 0.002,
                            diameterRatio: 1.8,
                            offAxisFraction: -0,
                            childDelegate: ListWheelChildBuilderDelegate(
                              childCount: model.chiqimList.length,
                              builder: (context, index) {
                                var item = model.chiqimList[index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: const DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          model.deleteChiqim(item.id);
                                        },
                                        icon: Icons.delete,
                                        backgroundColor: Colors.red,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      SlidableAction(
                                        onPressed: (context) {},
                                        icon: Icons.edit,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ],
                                  ),
                                  child: MyListTile(
                                    iconPath:
                                        "lib/icons/down-arrows_9847410.png",
                                    title: " ${item.izoh}",
                                    subtitle: NumberFormat.currency(
                                      locale: "Uz-uz",
                                      decimalDigits: 0,
                                    ).format(int.parse(item.narx)).toString(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
