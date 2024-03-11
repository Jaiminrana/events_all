import 'package:events_all/model/event_detail_dm.dart';
import 'package:events_all/utils/common%20widgets/ae_network_Image.dart';
import 'package:events_all/values/app_constant.dart';
import 'package:flutter/material.dart';

class AEEventGridView extends StatelessWidget {
  const AEEventGridView({
    super.key,
    required this.eventList,
  });

  final List<EventDetailDm> eventList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: eventList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        final url = eventList[index].bannerUrl;
        return url == null
            ? const SizedBox.shrink()
            : AENetworkImage(
                url: url,
                borderRadius:
                    const BorderRadius.all(AppConstant.roundedBorder10),
              );
      },
    );
  }
}
