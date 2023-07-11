import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatefulWidget {
  final int pageId;

  PopularFoodDetail({super.key, required this.pageId});

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  String valueChoose ="1";

  final List listQuantity =["1","2","3","4","5","6","7","8","9","10"];

  @override
  Widget build(BuildContext context) {
    var product= Get.find<PopularProductController>().popularProductList[widget.pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImgSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                        )
                    )
                  ),
                ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>MainFoodPage());
                    },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],

          )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)
                      ),
                      color: Colors.white
                    ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Description"),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description!)))
                  ],
                )
          )
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20*2, right: Dimensions.width20*2),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundCoolors,
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
                    child:GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child: DropdownButton(
                        isExpanded: false,
                        dropdownColor: AppColors.buttonBackgroundCoolors,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: Dimensions.iconSize24,
                        value: valueChoose,
                        items: listQuantity.map((items){
                          return DropdownMenuItem(value: items,child: Text(items));
                        }).toList(),
                        onChanged: (newValue){
                          setState((){
                            valueChoose = newValue.toString();
                          });
                        }
                      ),
                    )
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                  child: GestureDetector(
                    onTap:(){
                      popularProduct.addItem(product);
                    },
                    child: BigText(text: "\$ ${product.price!}"+" | Add to cart", color: Colors.white,)
                  ),
                )
              ],
            )
        );
      },),
      );
  }
}
