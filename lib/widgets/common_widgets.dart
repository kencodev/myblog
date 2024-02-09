import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/models/person.dart';
import 'package:myblog/models/article.dart';
import 'package:myblog/utils/common_methods.dart';
//import 'package:myblog/models/person.dart';



class ArticleCard extends StatelessWidget{
  final Article article;
  const ArticleCard(this.article, {super.key});
  
  @override
  Widget build(BuildContext context){
    return Card(
      shadowColor: Colors.grey,
      elevation: 6,
      child: ListTile(
        
        minVerticalPadding: 2,
        contentPadding: const EdgeInsets.all(8.0),
        leading: ClipRect(child: article.getImageUrl()),
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(article.title)),
        //subtitle: Text(article.content)
        trailing: Row(mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_up)),
        ],
        ),

      ),
    );
  }
}


final MySearchController searchController = Get.put(MySearchController());
Widget getSearchWiget(){
  return AppBar(title:
  Obx(() {
          return (searchController.isSearching.value) ? TextField(onChanged: (value) {
            // search logic

          },decoration: const InputDecoration(hintText: 'Search...',),) 
          : const Text('home sweet home');
        }),
        actions: [IconButton(onPressed: (){searchController.startSearch();}, icon:const Icon(Icons.search))],
        );

}

Widget myPopupMenu(){
  return PopupMenuButton(
    onSelected: (value) {
      
      handleMenuItemSelection(value);
    },
    itemBuilder: (BuildContext context) {
    return [
      const PopupMenuItem(
        value: 'option 1',
        child: Text('item 1')),
      const PopupMenuItem(
        value: 'option 2',
        child: Text('item 2'))
        ];
  },
  );
  
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget leading;
 // final Widget title;
  final List<Widget> actions;
  //final bool centerTitle;
  //final TextStyle titleTextStyle;

  const MyAppBar({super.key, this.actions = const[], required this.leading});

  @override
  Widget build(BuildContext context){
  return AppBar(
        
        actions: [IconButton(onPressed: (){
          Get.changeTheme(Get.isDarkMode ? ThemeData.light() 
          : ThemeData.dark(),);
          }, icon: const Icon(Icons.lightbulb_outline)),
          myPopupMenu(),
          ],
        
      );

  }
      
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class UserAccountWidget extends StatelessWidget{
  final User? loggedInUser;

  const UserAccountWidget({super.key,  this.loggedInUser});

  @override 
  Widget build(BuildContext context){
    return Card(
      
      child: Column(
      children: [
    CircleAvatar(
      backgroundImage: loggedInUser?.profileImageUrl != null 
      ? AssetImage(loggedInUser!.profileImageUrl!) : const AssetImage(r"assets\images\three.jpg"),
      radius: 20.0,
    ),
    const SizedBox(height: 8.0,),
    Text(loggedInUser!.username,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),)
      ]
    )
    );
  }

}

class UserAccInfo extends StatelessWidget{

  const UserAccInfo({super.key});
  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn 
    ? const CircleAvatar(
      radius: 15,
      backgroundImage: NetworkImage('',
      scale: 1.0)) 
    : const CircleAvatar(
      backgroundColor: Colors.amber,
      radius: 10,
      backgroundImage: AssetImage(r"assets\images\two.jpg"),
      child: Text("data"),);
  }}