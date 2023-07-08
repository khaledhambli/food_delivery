import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({super.key});

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(child: BigText(size: Dimensions.font26,text:"Pizza")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5,bottom:10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              )
            ),
            pinned: true,
            backgroundColor: Colors.blueGrey,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:Column(
              children: [
                Container(
                  color: Colors.white70,
                  child: ExpandableTextWidget(text:"Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour Chicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sourChicken marinated in succulent sour "),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height20)
                )
              ],
            )

          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            //color: Colors.white,
            padding: EdgeInsets.only(left: Dimensions.width20*2.5, right: Dimensions.width20*2.5,top:Dimensions.height10,bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconSize: Dimensions.iconSize24,iconColor:Colors.white, backgroundColor: AppColors.mainColor, icon: Icons.remove),
                BigText(text: "\$ 12.88 "+" x "+" 0", color: AppColors.mainBlackColor, size: Dimensions.font26),
                AppIcon(iconSize: Dimensions.iconSize24,iconColor:Colors.white, backgroundColor: AppColors.mainColor, icon: Icons.add)
              ],
            ),
          ),
          Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: Colors.white,//AppColors.buttonBackgroundCoolors,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20*2),
                      topLeft: Radius.circular(Dimensions.radius20*2)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
                    child: BigText(text: "\$10 | Add to cart", color: Colors.white,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
