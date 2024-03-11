import 'package:events_all/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventWebViewScreen extends StatefulWidget {
  const EventWebViewScreen({
    super.key,
    required this.url,
    required this.eventTitle,
  });

  final String url;
  final String eventTitle;

  @override
  State<EventWebViewScreen> createState() => _EventWebViewScreenState();
}

class _EventWebViewScreenState extends State<EventWebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.eventTitle,
            style: context.textTheme.displayLarge,
          ),
        ),
        body: WebViewWidget(controller: controller));
  }
}
