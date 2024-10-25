import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mad2/model/menu.dart';
import 'package:mad2/provider/language_provider.dart';
import 'package:mad2/routes.dart';
import 'package:mad2/services/menu_service.dart';
import 'package:mad2/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  final menuService = MenuService();

  bool _isLoading = false;
  List<Menu> menuList = [];

  @override
  void initState() {
    super.initState();
    handleGetMenus();
  }

  void handleGetMenus() async{
    setState(() {
      _isLoading = true;
    });
    await menuService.loadMenu().then((List<Menu> items){
      setState(() {
        menuList = items;
        _isLoading = false;
      });

    }).catchError((err){
      setState(() {
        _isLoading = false;
      });
    });
  }

  void handleSaveMenu() async{
    List<String> menuList = List.generate(11, (i) => "ព័ត៏មាន");
    print("Menu List : $menuList");
    for(int i= 0; i < menuList.length ; i++){
      final bodyReq = {
        "name": "News",
        "nameKh":menuList[i]
      };
      await menuService.saveMenu(bodyReq);
    }
  }

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
        body: ListView(
          children: <Widget>[
            _buildCarouselSliderWidget(imageSliders),
            _buildSlideItem(imageSlideList),
            _buildLanguageSwitchWidget,
            _sloganTextRow,
            _isLoading ? CircularProgressIndicator() : _buildMenuWidget
          ],
        )
    );
  }

  Widget get _buildLanguageSwitchWidget {
    final khmer = IconButton(
      icon: Image.asset("assets/images/khmer.png"),
      onPressed: (){
        final provider = Provider.of<LanguageProvider>(context, listen: false);
        provider.changeLanguage(Locale("km"));
      },);
    final english = IconButton(
      icon: Image.asset("assets/images/english.png"),
      onPressed: (){
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

  Widget get _sloganTextRow{
    final msgText = Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: AppColor.appColor,
        child: Center(child: Text("អនាគតភាពជាអ្នកដឹកនាំ", style: TextStyle(color: Colors.white, fontSize: 18),))
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        msgText
      ],
    );
  }

  Widget get _buildMenuWidget {

    List<Widget> menu1 = [];
    List<Widget> menu2 = [];
    List<Widget> menu3 = [];
    for(int i =0; i < menuList.length ; i++){
      Menu menuItem = menuList[i];
      if(i <= 3){
        menu1.add(_buildMenuCard(menuItem: menuItem));
      }else if(i > 3 && i <= 6){
        menu2.add(i == 5 ? _buildMenuCard(menuItem: menuItem, isELearning: true) : _buildMenuCard(menuItem: menuItem));
      }else{
        menu3.add(_buildMenuCard(menuItem: menuItem));
      }
    }
    final row1 = Row(
      children: menu1,
    );
    final row2 = Row(
      children: menu2,
    );
    final row3 = Row(
      children: menu3,
    );
    final menuColumn = Column(
      children: [row1, row2, row3],
    );
    return menuColumn;
  }

  Widget _buildMenuCard({required Menu menuItem,int index = 0, bool isELearning = false}) {

    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<LanguageProvider>(context, listen: false);
    String langCode = provider.appLocal.languageCode;

    return GestureDetector(
        onTap: (){
          if(index == 0){
            RouteGenerator.key.currentState!.pushNamed(RouteGenerator.newsScreen);
          }
        },
      child: SizedBox(
        width: width / (isELearning ? 2 : 4),
        height: 80,
        child: Card(
          child: Column(
            children: [
              Icon(Icons.newspaper),
              Text("${ langCode == "en" ? menuItem.name : menuItem.nameKh }")
            ],
          ),
        ),
      ),
    );
  }

}
