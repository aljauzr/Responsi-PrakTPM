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
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
            "CNN ${widget.category.toUpperCase()}"
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: NewsApi.getCategoryList(widget.category),
          builder: (
              BuildContext context,
              AsyncSnapshot<dynamic> snapshot,
              ) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              NewsCategoryModel newsCategoryModel = NewsCategoryModel.fromJson(snapshot.data);
              return _buildSuccessSection(newsCategoryModel);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(NewsCategoryModel data) {
    List<Posts> filteredList = data.data!.posts!.toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NewsDetailPage(post: filteredList![index]),
                  )
              );
            },
            leading: Image.network(
              filteredList[index].thumbnail!,
              fit: BoxFit.cover,
            ),
            title: Text(
              filteredList[index].title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
