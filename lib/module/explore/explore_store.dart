import 'package:events_all/apibase/repository.dart';
import 'package:events_all/generated/l10n.dart';
import 'package:events_all/model/event_detail_dm.dart';
import 'package:events_all/services/SnackbarService.dart';
import 'package:events_all/utils/debouncer.dart';
import 'package:events_all/values/enumerations.dart';
import 'package:mobx/mobx.dart';

part 'explore_store.g.dart';

class ExploreStore = _ExploreStore with _$ExploreStore;

abstract class _ExploreStore with Store {
  _ExploreStore() {
    getEventDetailsList();
  }

  final debounce = Debounce();

  @observable
  bool isGridView = false;

  @observable
  String currentCategory = Str.current.all;

  @observable
  NetworkState eventState = NetworkState.idle;

  ObservableList<EventDetailDm> eventList = ObservableList();

  @computed
  bool get isAllCategory => currentCategory == Str.current.all;

  @computed
  String get view => isGridView ? Str.current.gridView : Str.current.listView;

  Future<void> getEventDetailsList() async {
    debounce.run(() async {
      try {
        eventState = NetworkState.loading;
        final result = await Repository.instance.getEventList(
          categories: currentCategory.toLowerCase(),
        );
        if (result.item != null) {
          eventList.addAll(result.item!);
          eventState = NetworkState.success;
        } else {
          throw Exception();
        }
      } catch (e) {
        eventState = NetworkState.error;
        SnackbarService.showSnack(Str.current.oopsSomethingWentWrong);
      }
    });
  }

  @action
  void onChangeCategory(String category) {
    currentCategory = category;
    getEventDetailsList();
  }

  void onToggleView() {
    isGridView = !isGridView;
  }
}
