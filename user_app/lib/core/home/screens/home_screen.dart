import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/core/home/widgets/product_card.dart';
import 'package:user_app/core/profile/screens/profile_screen.dart';
import 'package:user_app/provider/main_provider.dart';
import 'package:user_app/res/app_colors.dart';
import 'package:user_app/utils/user_full_functions.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Fetch products when the screen is initialized
    final provider = Provider.of<MainProvider>(context, listen: false);

    provider.setProductData(context);
    //lazzy loading logic

    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        provider.updateLazyLoading(true);
        provider.loadMoreData(); // Remove Future.delayed
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
        title: Text(
          "Home Section",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: getFontSize(20, getDeviceWidth(context)),
          ),
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, mainProvider, child) {
          return mainProvider.mainList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: mainProvider.isLazyLoading
                      ? mainProvider.mainList.length + 1
                      : mainProvider.mainList.length,
                  itemBuilder: (context, index) {
                    if (index == mainProvider.mainList.length) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return FadeInLeftBig(
                      delay: const Duration(milliseconds: 1),
                      child: ProductCard(
                        productModel: mainProvider.productList[index],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
