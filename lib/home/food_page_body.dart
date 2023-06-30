import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85); //faire apparaitre les menus défilant
  var _currPageValue=0.0; //pour réduire la taille de la slide quand on défile
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initStat(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue= pageController.page!;
        print("current value"+_currPageValue.toString());
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color : Colors.redAccent,
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position)
              {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(        //ajoute des petites boulettes qui indiquent à quel container on se trouve
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator (
            activeColor: AppColors.mainColor,
            shape: const Border(),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();  //definit une matric pour faire varier les dimensions des containers lors du défilement
    if(index==_currPageValue.floor()) {       //agit sur le container central , taille normale et rapetisse en défilant
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index==_currPageValue.floor()+1) {   //agit sur le container visible à droite , petite taille et grandit en défilant vers lui
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index==_currPageValue.floor()-1) {   //agit sur le container visible à gauche , petite taille et grandit en défilant vers lui
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;    //agit sur les containers à droite et à gauche pour apparaitre plus petit que le central
      var currTrans=_height*(1-_scaleFactor)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }

      return Transform(
          transform: matrix,    //ce qui est sené appliquer les transformations de taille aux containers
          child: Stack(
              children: [
                Container(
                    height: 220,
                    margin: EdgeInsets.only(left:10, right:10),
                    decoration : BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/image/food0.png"
                            )
                        )
                    )

                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 120,
                      margin: EdgeInsets.only(left:30, right:30, bottom: 30),
                      decoration : BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0,5)
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset:Offset(-5,0)
                          ),
                          BoxShadow(
                              color: Colors.white,
                              offset:Offset(5,0)
                          )
                        ]
                      ),
                      child: Container(
                          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(text: "Pizza"),
                                SizedBox(height: 10),
                                Row(
                                    children: [
                                      Wrap(
                                          children: List.generate(5,(index) => Icon(Icons.star,color:AppColors.mainColor,size: 15))
                                      ),
                                      SizedBox(width: 10),
                                      SmallText(text: "4.5"),
                                      SizedBox(width: 10),
                                      SmallText(text: "1200"),
                                      SizedBox(width: 2),
                                      SmallText(text: "comments"),
                                    ]
                                ),
                                SizedBox(height: 20),
                                Row(
                                    children: [
                                      IconAndTextWidget(icon: Icons.circle_sharp,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1),
                                      IconAndTextWidget(icon: Icons.location_on,
                                          text: "1.7km",
                                          iconColor: AppColors.mainColor),
                                      SizedBox(width: 5),
                                      IconAndTextWidget(icon: Icons.access_time_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor1),

                                    ]
                                )
                              ]
                          )
                      )
                  ),
                )
              ]
          ));
    }
  }

