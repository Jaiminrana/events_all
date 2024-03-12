import 'package:events_all/generated/l10n.dart';import 'package:events_all/model/event_detail_dm.dart';import 'package:events_all/module/event_web_view_screen.dart';import 'package:events_all/resources/resources.dart';import 'package:events_all/services/SnackbarService.dart';import 'package:events_all/utils/common%20widgets/ae_event_grid_view.dart';import 'package:events_all/utils/common%20widgets/ae_icon_card.dart';import 'package:events_all/utils/common%20widgets/ae_network_Image.dart';import 'package:events_all/utils/extensions.dart';import 'package:events_all/values/app_constant.dart';import 'package:events_all/values/enumerations.dart';import 'package:flutter/material.dart';import 'package:flutter_mobx/flutter_mobx.dart';class AeEventListView extends StatelessObserverWidget {  const AeEventListView({    super.key,    required this.eventList,    required this.networkState,    this.isGridView = false,  });  final List<EventDetailDm> eventList;  final NetworkState networkState;  final bool isGridView;  @override  Widget build(BuildContext context) {    final textTheme = context.textTheme;    final tileHeight = MediaQuery.of(context).size.height * 0.2;    return Visibility(      visible: !networkState.isLoading,      replacement: const Center(        child: CircularProgressIndicator(),      ),      child: isGridView          ? AEEventGridView(              eventList: eventList,              onTap: (url, name) => _openWebView(                eventUrl: url,                eventName: name,                context: context,              ),            )          : ListView.builder(              padding: EdgeInsets.zero,              itemCount: eventList.length,              itemBuilder: (context, index) {                final event = eventList[index];                return event.eventName == null                    ? const SizedBox.shrink()                    : GestureDetector(                        onTap: () => _openWebView(                          eventUrl: event.eventUrl,                          eventName: event.eventName,                          context: context,                        ),                        child: Container(                          margin: const EdgeInsets.all(8),                          decoration: const BoxDecoration(                            color: Colors.white,                            borderRadius: BorderRadius.all(                              Radius.circular(10),                            ),                          ),                          child: SizedBox(                            height: tileHeight,                            child: Row(                              crossAxisAlignment: CrossAxisAlignment.start,                              children: [                                AENetworkImage(                                  height: tileHeight,                                  width: 150,                                  url: event.bannerUrl ?? AppConstant.kEmpty,                                  borderRadius: const BorderRadius.all(                                      AppConstant.roundedBorder10),                                ),                                Expanded(                                  child: Padding(                                    padding:                                        const EdgeInsets.fromLTRB(8, 8, 8, 0),                                    child: Column(                                      crossAxisAlignment:                                          CrossAxisAlignment.start,                                      children: [                                        Text(                                          event.eventName!,                                          style: textTheme.displayLarge,                                          maxLines: 2,                                          overflow: TextOverflow.ellipsis,                                        ),                                        if (event.label != null)                                          Text(                                            event.label!,                                            style: textTheme.bodyMedium,                                            maxLines: 1,                                          ),                                        if (event.location != null)                                          Text(                                            event.location!,                                            style: textTheme.bodyMedium,                                            maxLines: 1,                                          ),                                        const Spacer(),                                        Row(                                          children: [                                            if (event.thumbUrl != null)                                              AENetworkImage.oval(                                                height: 30,                                                width: 30,                                                fit: BoxFit.cover,                                                url: event.thumbUrl!,                                              ),                                            const SizedBox(width: 4),                                            Expanded(                                              child: Text(                                                event.categories?.firstOrNull ??                                                    '',                                              ),                                            ),                                            const AEIconCard(                                              assetName: Vectors.share,                                            ),                                            const SizedBox(width: 10),                                            const AEIconCard(                                              assetName: Vectors.star,                                            ),                                          ],                                        ),                                        const SizedBox(height: 8),                                      ],                                    ),                                  ),                                ),                              ],                            ),                          ),                        ),                      );              },            ),    );  }  void _openWebView({    required String? eventUrl,    required String? eventName,    required BuildContext context,  }) {    if (eventUrl == null || eventName == null) {      SnackbarService.showSnack(Str.current.oopsSomethingWentWrong);      return;    }    Navigator.push(      context,      MaterialPageRoute(        builder: (context) {          return EventWebViewScreen(            url: eventUrl,            eventTitle: eventName,          );        },      ),    );  }}