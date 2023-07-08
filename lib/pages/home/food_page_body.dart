import 'package:dots_indicator/dots_indicator.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85); //faire apparaitre les menus défilant
  var _currPageValue=0.0; //pour réduire la taille de la slide quand on défile
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currPageValue=pageController.page!;
        //print(_currPageValue);
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
        //slider section
        GetBuilder<PopularProductController>(builder:(popularProducts){
        return Container(
          //color : Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, position)
              {
                return _buildPageItem(position);
              }),
        );
        }),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(        //ajoute des petites boulettes qui indiquent à quel container on se trouve
            dotsCount: popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,//popularProducts.popularProductList.length, //popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              shape: const Border(),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom:3),
                child: BigText(text:".", color:Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom:2),
                child: SmallText(text: "Food pairing",)
              )
          ],
          ),
        ),
        //list of good food
        ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:10,
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                  child: Row(
                      children: [
                        // image in the row
                        Container(
                          width:Dimensions.listViewImgSize,
                            height:Dimensions.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color:Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/image/food1.png"
                                    )
                                )

                            )
                        ),
                        //text container
                        Expanded(
                          child: Container(
                            height:Dimensions.listViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.radius20),
                                bottomRight: Radius.circular(Dimensions.radius20)
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Nutritious fruit meal in Italy"),
                                  SizedBox(height:Dimensions.height10),
                                  SmallText(text: "With italian schrimps"),
                                  SizedBox(height:Dimensions.height10),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(icon: Icons.location_on,
                                            text: "1.7km",
                                            iconColor: AppColors.mainColor),
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

                  ),
                );
              })


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
                    height: Dimensions.pageViewContainer,
                    margin: EdgeInsets.only(left:Dimensions.width10, right:Dimensions.width10),
                    decoration : BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius30),
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
                      height: Dimensions.pageViewTextContainer,
                      margin: EdgeInsets.only(left:Dimensions.width30, right:Dimensions.width30, bottom: Dimensions.height30),
                      decoration : BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
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
                          padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                          child: AppColumn(text: "Pizza"),
                      )
                  ),
                )
              ]
          ));
    }
  }

