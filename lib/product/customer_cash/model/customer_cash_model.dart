import 'package:json_annotation/json_annotation.dart';

part 'customer_cash_model.g.dart';

@JsonSerializable()
class CustomerCashModel {
  @JsonKey(name: "current_page")
  int currentPage;
  @JsonKey(name: "data")
  List<Datum> data;
  @JsonKey(name: "first_page_url")
  String firstPageUrl;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "last_page_url")
  String lastPageUrl;
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

  CustomerCashModel({
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

  factory CustomerCashModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerCashModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerCashModelToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "location_latitude")
  String? locationLatitude;
  @JsonKey(name: "location_longitude")
  String? locationLongitude;
  @JsonKey(name: "status_id")
  String statusId;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "company_area_id")
  String? companyAreaId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "payment_status_id")
  String? paymentStatusId;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "status")
  Status status;
  @JsonKey(name: "payment_status")
  Status? paymentStatus;
  @JsonKey(name: "company")
  Company company;

  Datum({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.locationLatitude,
    required this.locationLongitude,
    required this.statusId,
    required this.totalPrice,
    required this.companyAreaId,
    required this.description,
    required this.paymentStatusId,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.paymentStatus,
    required this.company,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Company {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;

  Company({
    required this.id,
    required this.title,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  Status({
    required this.id,
    required this.name,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
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
