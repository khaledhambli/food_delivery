import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../data/api/api_client.dart';

Future<void> init()async{
  //api client
  Get.lazyPut(()=> ApiClient(appBaseUrl:AppConstants.BASE_URL));
  //print("ok apiclient");

  //repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  //print("ok repo");

  //controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
  //print("ok controller");
}
