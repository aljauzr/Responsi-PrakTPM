import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/api_calls/api_cnn.dart';
import 'package:latihan_responsi_praktpm/models/model_newscategory.dart';

class NewsDetailPage extends StatefulWidget {
  String category;
  Posts post;
  NewsDetailPage({Key? key, required this.category, required this.post}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            "CNN News"
        ),
      ),
      body: FutureBuilder(
        future: NewsApi().getCategoryList(widget.category),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Text("Tidak ada data"),
              ),
            );
          } else {
            Posts post = snapshot.data.posts;
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(post.thumbnail!),
                              fit: BoxFit.contain)),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      post.title!,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      post.description!,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
