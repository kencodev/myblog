import 'package:flutter/material.dart';

class Article{
  final String title;
  final String content;
  final String? pictureUrl;

  Article(this.title, this.content, this.pictureUrl);

  Widget getImageUrl(){
    return pictureUrl != null 
    ? Image.asset(pictureUrl!,  ): const SizedBox.shrink();
  }

  
}

final  List<Article> articles = [Article("title 1 yryyr hhhhthh ehyyryyruutu hrhhrhhr jrjjtjjt yrrh", "cotet 1", r"assets\images\two.jpg"), 
Article("title2", "cotet2", r"assets\images\three.jpg")];