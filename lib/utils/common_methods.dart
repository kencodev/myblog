import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearchController extends GetxController{
  final TextEditingController searchController = TextEditingController();
  RxBool isSearching = false.obs;



  void startSearch(){
    isSearching.value = true;
  }

  void endSearch(){
    isSearching.value = false;
    searchController.clear();

  }
  
}
// method to handle appbarmenu items
void handleMenuItemSelection(String value){
  switch (value){
    case 'option 1':
    // handle logic
    break;

    case 'option 2':
    //handle logic
    break;
  }
}
