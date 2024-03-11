import 'package:events_all/apibase/repository.dart';
import 'package:events_all/generated/l10n.dart';
import 'package:events_all/model/event_detail_dm.dart';
import 'package:events_all/services/SnackbarService.dart';
import 'package:events_all/values/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  _FeedStore() {
    getEventDetailsList();
  }

  @observable
  NetworkState eventState = NetworkState.idle;

  ObservableList<EventDetailDm> eventList = ObservableList();

  Future<void> getEventDetailsList() async {
    try {
      eventState = NetworkState.loading;
      final result = await Repository.instance.getEventList(
        categories: EventCategory.all.name,
      );
      if (result.item != null) {
        eventList.addAll(result.item!);
        eventState = NetworkState.success;
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint('Error $e');
      eventState = NetworkState.error;
      SnackbarService.showSnack(Str.current.oopsSomethingWentWrong);
    }
  }
}
