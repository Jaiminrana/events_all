import 'package:json_annotation/json_annotation.dart';

part 'meta_data_dm.g.dart';

@JsonSerializable()
class MetaDataDm {
  const MetaDataDm({
    this.venue,
    this.ids,
    this.type,
    this.city,
    this.edate,
    this.page,
    this.keywords,
    this.sdate,
    this.category,
    this.cityDisplay,
    this.rows,
  });

  factory MetaDataDm.fromJson(Map<String, dynamic> json) =>
      _$MetaDataDmFromJson(json);

  final String? venue;
  final String? ids;
  final String? type;
  final String? city;
  final int? edate;
  final int? page;
  final String? keywords;
  final int? sdate;
  final String? category;
  final String? cityDisplay;
  final int? rows;

  Map<String, dynamic> toJson() => _$MetaDataDmToJson(this);
}
