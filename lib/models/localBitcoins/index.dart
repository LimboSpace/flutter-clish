// To parse this JSON data, do
//
//     final localBitcoins = localBitcoinsFromJson(jsonString);

import 'dart:convert';

LocalBitcoins localBitcoinsFromJson(String str) =>
    LocalBitcoins.fromJson(json.decode(str));

String localBitcoinsToJson(LocalBitcoins data) => json.encode(data.toJson());

class LocalBitcoins {
  LocalBitcoins({
    this.data,
    this.pagination,
  });

  LocalBitcoinsData? data;
  Pagination? pagination;

  factory LocalBitcoins.fromJson(Map<String, dynamic> json) => LocalBitcoins(
        data: json["data"] == null
            ? null
            : LocalBitcoinsData.fromJson(json["data"]),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "pagination": pagination?.toJson(),
      };
}

class LocalBitcoinsData {
  LocalBitcoinsData({
    this.adList,
    this.adCount,
  });

  List<AdList>? adList;
  int? adCount;

  factory LocalBitcoinsData.fromJson(Map<String, dynamic> json) =>
      LocalBitcoinsData(
        adList: json["ad_list"] == null
            ? []
            : List<AdList>.from(
                json["ad_list"]!.map((x) => AdList.fromJson(x))),
        adCount: json["ad_count"],
      );

  Map<String, dynamic> toJson() => {
        "ad_list": adList == null
            ? []
            : List<dynamic>.from(adList!.map((x) => x.toJson())),
        "ad_count": adCount,
      };
}

class AdList {
  AdList({
    this.data,
    this.actions,
  });

  AdListData? data;
  Actions? actions;

  factory AdList.fromJson(Map<String, dynamic> json) => AdList(
        data: json["data"] == null ? null : AdListData.fromJson(json["data"]),
        actions:
            json["actions"] == null ? null : Actions.fromJson(json["actions"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "actions": actions?.toJson(),
      };
}

class Actions {
  Actions({
    this.publicView,
  });

  String? publicView;

  factory Actions.fromJson(Map<String, dynamic> json) => Actions(
        publicView: json["public_view"],
      );

  Map<String, dynamic> toJson() => {
        "public_view": publicView,
      };
}

class AdListData {
  AdListData({
    this.profile,
    this.visible,
    this.hiddenByOpeningHours,
    this.locationString,
    this.countrycode,
    this.city,
    this.tradeType,
    this.onlineProvider,
    this.firstTimeLimitBtc,
    this.volumeCoefficientBtc,
    this.smsVerificationRequired,
    this.currency,
    this.lat,
    this.lon,
    this.minAmount,
    this.maxAmount,
    this.maxAmountAvailable,
    this.minAmountAvailable,
    this.adId,
    this.tempPriceUsd,
    this.tempPrice,
    this.createdAt,
    this.requireFeedbackScore,
    this.requireTradeVolume,
    this.msg,
    this.bankName,
    this.atmModel,
    this.requireTrustedByAdvertiser,
    this.requireIdentification,
    this.isLocalOffice,
    this.paymentWindowMinutes,
    this.limitToFiatAmounts,
    this.isLowRisk,
  });

  Profile? profile;
  bool? visible;
  bool? hiddenByOpeningHours;
  String? locationString;
  String? countrycode;
  String? city;
  String? tradeType;
  String? onlineProvider;
  dynamic firstTimeLimitBtc;
  String? volumeCoefficientBtc;
  bool? smsVerificationRequired;
  String? currency;
  double? lat;
  double? lon;
  String? minAmount;
  String? maxAmount;
  String? maxAmountAvailable;
  String? minAmountAvailable;
  int? adId;
  String? tempPriceUsd;
  String? tempPrice;
  DateTime? createdAt;
  int? requireFeedbackScore;
  double? requireTradeVolume;
  String? msg;
  String? bankName;
  dynamic atmModel;
  bool? requireTrustedByAdvertiser;
  bool? requireIdentification;
  bool? isLocalOffice;
  int? paymentWindowMinutes;
  dynamic limitToFiatAmounts;
  bool? isLowRisk;

  factory AdListData.fromJson(Map<String, dynamic> json) => AdListData(
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        visible: json["visible"],
        hiddenByOpeningHours: json["hidden_by_opening_hours"],
        locationString: json["location_string"],
        countrycode: json["countrycode"],
        city: json["city"],
        tradeType: json["trade_type"],
        onlineProvider: json["online_provider"],
        firstTimeLimitBtc: json["first_time_limit_btc"],
        volumeCoefficientBtc: json["volume_coefficient_btc"],
        smsVerificationRequired: json["sms_verification_required"],
        currency: json["currency"],
        lat: json["lat"],
        lon: json["lon"],
        minAmount: json["min_amount"],
        maxAmount: json["max_amount"],
        maxAmountAvailable: json["max_amount_available"],
        minAmountAvailable: json["min_amount_available"],
        adId: json["ad_id"],
        tempPriceUsd: json["temp_price_usd"],
        tempPrice: json["temp_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        requireFeedbackScore: json["require_feedback_score"],
        requireTradeVolume: json["require_trade_volume"],
        msg: json["msg"],
        bankName: json["bank_name"],
        atmModel: json["atm_model"],
        requireTrustedByAdvertiser: json["require_trusted_by_advertiser"],
        requireIdentification: json["require_identification"],
        isLocalOffice: json["is_local_office"],
        paymentWindowMinutes: json["payment_window_minutes"],
        limitToFiatAmounts: json["limit_to_fiat_amounts"],
        isLowRisk: json["is_low_risk"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "visible": visible,
        "hidden_by_opening_hours": hiddenByOpeningHours,
        "location_string": locationString,
        "countrycode": countrycode,
        "city": city,
        "trade_type": tradeType,
        "online_provider": onlineProvider,
        "first_time_limit_btc": firstTimeLimitBtc,
        "volume_coefficient_btc": volumeCoefficientBtc,
        "sms_verification_required": smsVerificationRequired,
        "currency": currency,
        "lat": lat,
        "lon": lon,
        "min_amount": minAmount,
        "max_amount": maxAmount,
        "max_amount_available": maxAmountAvailable,
        "min_amount_available": minAmountAvailable,
        "ad_id": adId,
        "temp_price_usd": tempPriceUsd,
        "temp_price": tempPrice,
        "created_at": createdAt?.toIso8601String(),
        "require_feedback_score": requireFeedbackScore,
        "require_trade_volume": requireTradeVolume,
        "msg": msg,
        "bank_name": bankName,
        "atm_model": atmModel,
        "require_trusted_by_advertiser": requireTrustedByAdvertiser,
        "require_identification": requireIdentification,
        "is_local_office": isLocalOffice,
        "payment_window_minutes": paymentWindowMinutes,
        "limit_to_fiat_amounts": limitToFiatAmounts,
        "is_low_risk": isLowRisk,
      };
}

class Profile {
  Profile({
    this.username,
    this.tradeCount,
    this.feedbackScore,
    this.name,
    this.lastOnline,
  });

  String? username;
  String? tradeCount;
  int? feedbackScore;
  String? name;
  DateTime? lastOnline;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json["username"],
        tradeCount: json["trade_count"],
        feedbackScore: json["feedback_score"],
        name: json["name"],
        lastOnline: json["last_online"] == null
            ? null
            : DateTime.parse(json["last_online"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "trade_count": tradeCount,
        "feedback_score": feedbackScore,
        "name": name,
        "last_online": lastOnline?.toIso8601String(),
      };
}

class Pagination {
  Pagination({
    this.next,
  });

  String? next;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
      };
}
