// import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad2/provider/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {


    final imageSlideList = [
      "assets/images/slide0.jpg",
      "assets/images/slide1.jpg",
      "assets/images/slide2.jpg",
      "assets/images/slide3.jpg",
      "assets/images/slide4.jpg",
    ];

    final List<Widget> imageSliders = imageSlideList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text('Welcome to BELTEI Internation School',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    )).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/BELTEI_international_university_logo.png", height: 50,),
        elevation: 10,
        backgroundColor: const Color(0xFF018AAA),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(child: Icon(Icons.notifications),
              position: badges.BadgePosition.topEnd(top: 0, end: 3),
              showBadge: true,
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.red
              ),
              badgeContent: Text("10", style: TextStyle(
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
      body: Column(
            children: <Widget>[
              _buildCarouselSliderWidget(imageSliders),
              _buildSlideItem(imageSlideList),
              _buildLanguageSwitchWidget
              // _buildMenuTitleWidget,
              // _buildMenuListWidget
            ],
          )
    );
  }

  Widget get _buildLanguageSwitchWidget {
      final khmer = ElevatedButton(
        child: Text("Khmer"),
        onPressed: (){
        final provider = Provider.of<LanguageProvider>(context, listen: false);
        provider.changeLanguage(Locale("km"));
      },);
      final english = ElevatedButton(child: Text("English"),onPressed: (){
        final provider = Provider.of<LanguageProvider>(context, listen: false);
        provider.changeLanguage(Locale("en"));
      },);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          khmer,
          english
        ],
      ),
    );
  }

  Widget _buildCarouselSliderWidget(List<Widget> imageSliders) {
    return SizedBox(
      height: 240,
      child: CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
    );
  }

  Widget _buildSlideItem(List<String> imageSlideList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageSlideList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
  
}
