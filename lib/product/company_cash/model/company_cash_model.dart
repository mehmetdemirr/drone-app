import 'package:json_annotation/json_annotation.dart';

part 'company_cash_model.g.dart';

@JsonSerializable()
class CompanyCashModel {
  @JsonKey(name: "current_page")
  int currentPage;
  @JsonKey(name: "data")
  List<DatumCompanyCash> data;
  @JsonKey(name: "first_page_url")
  String? firstPageUrl;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String? lastPageUrl;
  @JsonKey(name: "links")
  List<Link> links;
  @JsonKey(name: "next_page_url")
  String? nextPageUrl;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "prev_page_url")
  String? prevPageUrl;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int total;

  CompanyCashModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory CompanyCashModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyCashModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyCashModelToJson(this);
}

@JsonSerializable()
class DatumCompanyCash {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "status_id")
  String statusId;
  @JsonKey(name: "payment_status_id")
  String paymentStatusId;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  DatumCompanyCash({
    required this.id,
    required this.username,
    required this.statusId,
    required this.paymentStatusId,
    required this.totalPrice,
    required this.count,
    required this.createdAt,
  });

  factory DatumCompanyCash.fromJson(Map<String, dynamic> json) =>
      _$DatumCompanyCashFromJson(json);

  Map<String, dynamic> toJson() => _$DatumCompanyCashToJson(this);
}

@JsonSerializable()
class Link {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "label")
  String label;
  @JsonKey(name: "active")
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
