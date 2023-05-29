import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/api_calls/api_cnn.dart';
import 'package:latihan_responsi_praktpm/models/model_newscategory.dart';
import 'package:latihan_responsi_praktpm/pages/page_detail_news.dart';

class NewsListPage extends StatefulWidget {
  String category;
  NewsListPage({Key? key, required this.category}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "CNN ${widget.category.toUpperCase()}"
        ),
      ),
      body: Container(
          child: FutureBuilder(
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
                return ListView.builder(
                  itemCount: snapshot.data.data.posts.length,
                  itemBuilder: (context, index) {
                    final Posts post = snapshot.data.data.posts.length[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailPage(category: widget.category, post: post),
                              ));
                        },
                        leading: Image.network(
                          snapshot.data.data.posts.thumbnail,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                        ),
                        title: Text(snapshot.data[index].toUpperCase()),
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
