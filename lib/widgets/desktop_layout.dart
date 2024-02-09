import 'package:flutter/material.dart';
import 'package:myblog/models/article.dart';


class DesktopScreen extends StatelessWidget{
  const DesktopScreen({super.key});

  @override
Widget build(BuildContext context){
  return Scaffold(
    body: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Card(),
      GridView.builder(
      itemCount: articles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index){
        return ArticleGridCard(articles[index]);

      })
    ],
  )
  );
}
}

class ArticleGridCard extends StatelessWidget {
  final Article article;
  const ArticleGridCard(this.article, {super.key});

  @override
  Widget build(BuildContext context){
    return Card(
      child: GridTile(
        header: const Image(image: NetworkImage('url')),
        footer: Text(article.title),
        child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.thumb_up)),
        ],

        )),

    );
  }
  
}