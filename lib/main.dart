import 'package:flutter/material.dart';



import 'package:get/get.dart';
import 'package:myblog/widgets/desktop_layout.dart';
import 'package:myblog/widgets/phone_layout.dart';
import 'package:myblog/widgets/tablet_layout.dart';void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/phoneHome', page: () => const PhoneScreen()),
        GetPage(name: '/tabletHome', page: () => const TabletScreen()),
        GetPage(name: '/desktopHome', page: () => const DesktopScreen()),
        //GetPage(name: '/phoneCompose', page: () => const PhoneCompose()),
        //GetPage(name: '/tabletCompose', page: () => const TabletCompose()),
        //GetPage(name: '/desktopCompose', page: () => const DesktopCompose()),
        //GetPage(name: '/phoneLogin', page: () => const PhoneLogin()),
        ],

      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.blue),
      home: LayoutBuilder(
          builder:(context, constraints){
            if(constraints.maxWidth > 1000){
              return const DesktopScreen();
            }else if(constraints.maxWidth >= 600 && constraints.maxWidth < 1000){
              return const TabletScreen();
            }else{
              return const PhoneScreen();
            }
          },

        )
        
    
    );
  }
}