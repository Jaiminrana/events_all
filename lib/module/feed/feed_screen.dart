import 'package:events_all/module/feed/feed_store.dart';
import 'package:events_all/utils/common%20widgets/ae_event_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessObserverWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<FeedStore>();

    return AeEventListView(
      networkState: store.eventState,
      eventList: store.eventList,
    );
  }
}
