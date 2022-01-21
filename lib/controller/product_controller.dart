import 'package:fluthut/api_service/remote_service.dart';
import 'package:fluthut/models/all_products_model/all_products_model.dart';
import 'package:get/get.dart';



class ProductsController extends GetxController{

  var productList = List<ProductsModel>.empty().obs;
  var isLoadingProducts = true.obs;

  void fetchProductsData()async{
    print("calling caat");
    try{
      isLoadingProducts(true);
      var productsData = await RemoteService.getProducts();

      if(productsData!=null){
        productList.value=productsData;
      }
    }
    finally{
      isLoadingProducts(false);
    }

  }

}