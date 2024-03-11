import 'package:events_all/model/event_detail_dm.dart';
import 'package:events_all/model/meta_data_dm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dm.g.dart';

@JsonSerializable(explicitToJson: true)
class EventDm {
  const EventDm({
    this.metaData,
    this.count,
    this.item,
  });

  factory EventDm.fromJson(Map<String, dynamic> json) =>
      _$EventDmFromJson(json);

  @JsonKey(name: 'request')
  final MetaDataDm? metaData;
  final int? count;
  final List<EventDetailDm>? item;

  Map<String, dynamic> toJson() => _$EventDmToJson(this);
}
