import 'package:flutter/material.dart';
import 'package:newspaper/api.dart';
import 'package:newspaper/model.dart';


class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Sports News",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: NewsHelper.newsHelper.fetchAllSportsNewsData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    NewsModel? data = snapshot.data;

                    return ListView.builder(
                      itemCount: data!.sportsNews.length,
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "${data.news[i]['urlToImage']}",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                height: h * 0.4,
                                width: w,
                              ),
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).pushNamed(
                                    "DetailPage",
                                    arguments: data.sportsNews[i]['url'],
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    "${data.news[i]['source']['name']}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "\t${data.news[i]['publishedAt']}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Text(
                              "${data.news[i]['title']}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.04,
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}