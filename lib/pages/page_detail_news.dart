import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/models/model_newscategory.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String formatDate(String dateString) {
  final parsedDate = DateTime.parse(dateString);
  final formattedDate = DateFormat('EEEE, d MMMM yyyy').format(parsedDate);
  return formattedDate;
}

class NewsDetailPage extends StatefulWidget {
  Posts post;
  NewsDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = formatDate(widget.post.pubDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
            "CNN News"
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.post.title!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$formattedDate',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.network(widget.post.thumbnail!),
                ),
                SizedBox(height: 10),
                Text(widget.post.description!),
                SizedBox(height: 10),
                InkWell(
                  child: Text(
                    "Baca Selengkapnya...",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onTap: () => launch('https://${widget.post.link!}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
