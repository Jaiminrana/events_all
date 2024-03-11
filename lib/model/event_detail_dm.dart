import 'package:json_annotation/json_annotation.dart';

part 'event_detail_dm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EventDetailDm {
  const EventDetailDm({
    this.eventId,
    this.eventName,
    this.eventNameRaw,
    this.ownerId,
    this.thumbUrl,
    this.thumbUrlLarge,
    this.startTime,
    this.startTimeDisplay,
    this.endTime,
    this.endTimeDisplay,
    this.location,
    this.venue,
    this.label,
    this.featured,
    this.eventUrl,
    this.shareUrl,
    this.bannerUrl,
    this.score,
    this.categories,
    this.tags,
    this.tickets,
    this.customParams,
  });

  factory EventDetailDm.fromJson(Map<String, dynamic> json) =>
      _$EventDetailDmFromJson(json);

  final String? eventId;
  @JsonKey(name: 'eventname')
  final String? eventName;
  @JsonKey(name: 'eventname_raw')
  final String? eventNameRaw;
  final String? ownerId;
  final String? thumbUrl;
  final String? thumbUrlLarge;
  final int? startTime;
  final String? startTimeDisplay;
  final int? endTime;
  final String? endTimeDisplay;
  final String? location;
  final VenueDm? venue;
  final String? label;
  final int? featured;
  final String? eventUrl;
  final String? shareUrl;
  final String? bannerUrl;
  final double? score;
  final List<String>? categories;
  final List<String>? tags;
  final TicketsDm? tickets;
  final List<dynamic>? customParams;

  Map<String, dynamic> toJson() => _$EventDetailDmToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class VenueDm {
  const VenueDm({
    this.street,
    this.city,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.fullAddress,
  });

  factory VenueDm.fromJson(Map<String, dynamic> json) =>
      _$VenueDmFromJson(json);

  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final double? latitude;
  final double? longitude;
  final String? fullAddress;

  Map<String, dynamic> toJson() => _$VenueDmToJson(this);
}

@JsonSerializable()
class TicketsDm {
  const TicketsDm({
    this.hasTickets,
    this.ticketUrl,
    this.ticketCurrency,
    this.minTicketPrice,
    this.maxTicketPrice,
  });

  factory TicketsDm.fromJson(Map<String, dynamic> json) =>
      _$TicketsDmFromJson(json);

  final bool? hasTickets;
  final String? ticketUrl;
  final String? ticketCurrency;
  final int? minTicketPrice;
  final int? maxTicketPrice;

  Map<String, dynamic> toJson() => _$TicketsDmToJson(this);
}
