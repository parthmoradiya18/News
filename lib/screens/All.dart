import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey inAppWebViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  double myProgress = 0;
  String myUrl = "";
  String? currentUrl;
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return WillPopScope(
      onWillPop: () async {
        await webViewController!.goBack();
        return (currentUrl == myUrl) ? true : false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Breaking News",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.refresh,
              ),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: myProgress,
              color: Colors.red,
            ),
            Expanded(
              flex: 15,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse("$res"),
                ),
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  setState(() {
                    webViewController = controller;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}