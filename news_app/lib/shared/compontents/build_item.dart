import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view_Screen/web_view_screen.dart';

Widget buildNewItem(model, context) {
  String def =
      'https://image.freepik.com/free-vector/breaking-news-tv-concept-backdrop-banner_1017-14194.jpg';
  String img = model['urlToImage'];
  if (img == null) {
    img = def;
  }
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebViewScreen(model['url']),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${model['title']}',
                      maxLines: 3,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    '${model['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
