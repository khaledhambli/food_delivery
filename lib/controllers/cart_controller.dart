import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int,CartModel> _items={};
  Map<int,CartModel> get items=>_items;

  void addItem(ProductModel product, int quantity){
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,             //id est une clé primaire
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity!+quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    }else{
      _items.putIfAbsent(product.id!,()=>CartModel(
        id: product.id,             //id est une clé primaire
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExist: true,
        time: DateTime.now().toString(),
      ));
    }


  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }else{
      return false;
    }
  }

  getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key,value){
        if(key==product.id){
           quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }
}