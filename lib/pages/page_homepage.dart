import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/pages/page_list_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 0.7,
                child: Image.network(
                  "https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsListPage(category: 'terbaru'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set button color to red
                      ),
                      child: Text("TERBARU"),
                    ),
                  ),
                  SizedBox(width: 10), // Add a smaller gap between the buttons
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsListPage(category: 'nasional'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set button color to red
                      ),
                      child: Text("NASIONAL"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Add a smaller gap between the rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsListPage(category: 'olahraga'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set button color to red
                      ),
                      child: Text("OLAHRAGA"),
                    ),
                  ),
                  SizedBox(width: 10), // Add a smaller gap between the buttons
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsListPage(category: 'teknologi'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set button color to red
                      ),
                      child: Text("TEKNOLOGI"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
