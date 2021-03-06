import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/details_screen.dart';
import 'package:food_delivery_app/widgets/category_title.dart';
import 'package:food_delivery_app/widgets/food_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          headline: TextStyle(fontWeight: FontWeight.bold),
          button: TextStyle(fontWeight: FontWeight.bold),
          title: TextStyle(fontWeight: FontWeight.bold),
          body1: TextStyle(color: kTextColor),
        )
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.26),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
          child: SvgPicture.asset("assets/icons/plus.svg"),
         ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/icons/menu.svg", height: 11,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Simple way to find \nTasty food",
              style: Theme.of(context).textTheme.headline,
            )
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryTitle(title: "All", active: true,),
                CategoryTitle(title: "Italian"),
                CategoryTitle(title: "Asian"),
                CategoryTitle(title: "Chinese"),
                CategoryTitle(title: "American"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBorderColor),
            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FoodCard(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return DetailsScreen();
                        }
                      )
                    );
                  },
                  title: "Vegan Salad Bowl",
                  image: "assets/images/image_1.png",
                  price: 20,
                  calories: "430Kcal",
                  description: "Salad yang sangat enak dan bergizi tinggi baik untuk pertumbuhan anak.",
                  ingredients: "Tomato and some vegetable",
                ),
                FoodCard(
                  title: "Vegan Salad Bowl",
                  image: "assets/images/image_2.png",
                  price: 20,
                  calories: "430Kcal",
                  description: "Salad yang sangat enak dan bergizi tinggi baik untuk pertumbuhan anak.",
                  ingredients: "Tomato and some vegetable",
                ),
                SizedBox(width: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}