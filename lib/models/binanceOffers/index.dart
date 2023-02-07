// To parse this JSON data, do
//
//     final localBitcoins = localBitcoinsFromJson(jsonString);

import 'dart:convert';

LocalBitcoins localBitcoinsFromJson(String str) =>
    LocalBitcoins.fromJson(json.decode(str));

String localBitcoinsToJson(LocalBitcoins data) => json.encode(data.toJson());

class LocalBitcoins {
  LocalBitcoins({
    this.code,
    this.message,
    this.messageDetail,
    this.data,
    this.total,
    this.success,
  });

  String? code;
  dynamic message;
  dynamic messageDetail;
  List<Datum>? data;
  int? total;
  bool? success;

  factory LocalBitcoins.fromJson(Map<String, dynamic> json) => LocalBitcoins(
        code: json["code"],
        message: json["message"],
        messageDetail: json["messageDetail"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        total: json["total"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "messageDetail": messageDetail,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
        "success": success,
      };
}

class Datum {
  Datum({
    this.adv,
    this.advertiser,
  });

  Adv? adv;
  Advertiser? advertiser;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        adv: json["adv"] == null ? null : Adv.fromJson(json["adv"]),
        advertiser: json["advertiser"] == null
            ? null
            : Advertiser.fromJson(json["advertiser"]),
      );

  Map<String, dynamic> toJson() => {
        "adv": adv?.toJson(),
        "advertiser": advertiser?.toJson(),
      };
}

class Adv {
  Adv({
    this.advNo,
    this.classify,
    this.tradeType,
    this.asset,
    this.fiatUnit,
    this.advStatus,
    this.priceType,
    this.priceFloatingRatio,
    this.rateFloatingRatio,
    this.currencyRate,
    this.price,
    this.initAmount,
    this.surplusAmount,
    this.amountAfterEditing,
    this.maxSingleTransAmount,
    this.minSingleTransAmount,
    this.buyerKycLimit,
    this.buyerRegDaysLimit,
    this.buyerBtcPositionLimit,
    this.remarks,
    this.autoReplyMsg,
    this.payTimeLimit,
    this.tradeMethods,
    this.userTradeCountFilterTime,
    this.userBuyTradeCountMin,
    this.userBuyTradeCountMax,
    this.userSellTradeCountMin,
    this.userSellTradeCountMax,
    this.userAllTradeCountMin,
    this.userAllTradeCountMax,
    this.userTradeCompleteRateFilterTime,
    this.userTradeCompleteCountMin,
    this.userTradeCompleteRateMin,
    this.userTradeVolumeFilterTime,
    this.userTradeType,
    this.userTradeVolumeMin,
    this.userTradeVolumeMax,
    this.userTradeVolumeAsset,
    this.createTime,
    this.advUpdateTime,
    this.fiatVo,
    this.assetVo,
    this.advVisibleRet,
    this.assetLogo,
    this.assetScale,
    this.fiatScale,
    this.priceScale,
    this.fiatSymbol,
    this.isTradable,
    this.dynamicMaxSingleTransAmount,
    this.minSingleTransQuantity,
    this.maxSingleTransQuantity,
    this.dynamicMaxSingleTransQuantity,
    this.tradableQuantity,
    this.commissionRate,
    this.tradeMethodCommissionRates,
    this.launchCountry,
    this.abnormalStatusList,
    this.closeReason,
  });

  String? advNo;
  String? classify;
  String? tradeType;
  String? asset;
  String? fiatUnit;
  dynamic advStatus;
  dynamic priceType;
  dynamic priceFloatingRatio;
  dynamic rateFloatingRatio;
  dynamic currencyRate;
  String? price;
  dynamic initAmount;
  String? surplusAmount;
  dynamic amountAfterEditing;
  String? maxSingleTransAmount;
  String? minSingleTransAmount;
  dynamic buyerKycLimit;
  dynamic buyerRegDaysLimit;
  dynamic buyerBtcPositionLimit;
  dynamic remarks;
  String? autoReplyMsg;
  dynamic payTimeLimit;
  List<Map<String, String?>>? tradeMethods;
  dynamic userTradeCountFilterTime;
  dynamic userBuyTradeCountMin;
  dynamic userBuyTradeCountMax;
  dynamic userSellTradeCountMin;
  dynamic userSellTradeCountMax;
  dynamic userAllTradeCountMin;
  dynamic userAllTradeCountMax;
  dynamic userTradeCompleteRateFilterTime;
  dynamic userTradeCompleteCountMin;
  dynamic userTradeCompleteRateMin;
  dynamic userTradeVolumeFilterTime;
  dynamic userTradeType;
  dynamic userTradeVolumeMin;
  dynamic userTradeVolumeMax;
  dynamic userTradeVolumeAsset;
  dynamic createTime;
  dynamic advUpdateTime;
  dynamic fiatVo;
  dynamic assetVo;
  dynamic advVisibleRet;
  dynamic assetLogo;
  int? assetScale;
  int? fiatScale;
  int? priceScale;
  String? fiatSymbol;
  bool? isTradable;
  String? dynamicMaxSingleTransAmount;
  String? minSingleTransQuantity;
  String? maxSingleTransQuantity;
  String? dynamicMaxSingleTransQuantity;
  String? tradableQuantity;
  String? commissionRate;
  List<dynamic>? tradeMethodCommissionRates;
  dynamic launchCountry;
  dynamic abnormalStatusList;
  dynamic closeReason;

  factory Adv.fromJson(Map<String, dynamic> json) => Adv(
        advNo: json["advNo"],
        classify: json["classify"],
        tradeType: json["tradeType"],
        asset: json["asset"],
        fiatUnit: json["fiatUnit"],
        advStatus: json["advStatus"],
        priceType: json["priceType"],
        priceFloatingRatio: json["priceFloatingRatio"],
        rateFloatingRatio: json["rateFloatingRatio"],
        currencyRate: json["currencyRate"],
        price: json["price"],
        initAmount: json["initAmount"],
        surplusAmount: json["surplusAmount"],
        amountAfterEditing: json["amountAfterEditing"],
        maxSingleTransAmount: json["maxSingleTransAmount"],
        minSingleTransAmount: json["minSingleTransAmount"],
        buyerKycLimit: json["buyerKycLimit"],
        buyerRegDaysLimit: json["buyerRegDaysLimit"],
        buyerBtcPositionLimit: json["buyerBtcPositionLimit"],
        remarks: json["remarks"],
        autoReplyMsg: json["autoReplyMsg"],
        payTimeLimit: json["payTimeLimit"],
        tradeMethods: json["tradeMethods"] == null
            ? []
            : List<Map<String, String?>>.from(json["tradeMethods"]!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
        userTradeCountFilterTime: json["userTradeCountFilterTime"],
        userBuyTradeCountMin: json["userBuyTradeCountMin"],
        userBuyTradeCountMax: json["userBuyTradeCountMax"],
        userSellTradeCountMin: json["userSellTradeCountMin"],
        userSellTradeCountMax: json["userSellTradeCountMax"],
        userAllTradeCountMin: json["userAllTradeCountMin"],
        userAllTradeCountMax: json["userAllTradeCountMax"],
        userTradeCompleteRateFilterTime:
            json["userTradeCompleteRateFilterTime"],
        userTradeCompleteCountMin: json["userTradeCompleteCountMin"],
        userTradeCompleteRateMin: json["userTradeCompleteRateMin"],
        userTradeVolumeFilterTime: json["userTradeVolumeFilterTime"],
        userTradeType: json["userTradeType"],
        userTradeVolumeMin: json["userTradeVolumeMin"],
        userTradeVolumeMax: json["userTradeVolumeMax"],
        userTradeVolumeAsset: json["userTradeVolumeAsset"],
        createTime: json["createTime"],
        advUpdateTime: json["advUpdateTime"],
        fiatVo: json["fiatVo"],
        assetVo: json["assetVo"],
        advVisibleRet: json["advVisibleRet"],
        assetLogo: json["assetLogo"],
        assetScale: json["assetScale"],
        fiatScale: json["fiatScale"],
        priceScale: json["priceScale"],
        fiatSymbol: json["fiatSymbol"],
        isTradable: json["isTradable"],
        dynamicMaxSingleTransAmount: json["dynamicMaxSingleTransAmount"],
        minSingleTransQuantity: json["minSingleTransQuantity"],
        maxSingleTransQuantity: json["maxSingleTransQuantity"],
        dynamicMaxSingleTransQuantity: json["dynamicMaxSingleTransQuantity"],
        tradableQuantity: json["tradableQuantity"],
        commissionRate: json["commissionRate"],
        tradeMethodCommissionRates: json["tradeMethodCommissionRates"] == null
            ? []
            : List<dynamic>.from(
                json["tradeMethodCommissionRates"]!.map((x) => x)),
        launchCountry: json["launchCountry"],
        abnormalStatusList: json["abnormalStatusList"],
        closeReason: json["closeReason"],
      );

  Map<String, dynamic> toJson() => {
        "advNo": advNo,
        "classify": classify,
        "tradeType": tradeType,
        "asset": asset,
        "fiatUnit": fiatUnit,
        "advStatus": advStatus,
        "priceType": priceType,
        "priceFloatingRatio": priceFloatingRatio,
        "rateFloatingRatio": rateFloatingRatio,
        "currencyRate": currencyRate,
        "price": price,
        "initAmount": initAmount,
        "surplusAmount": surplusAmount,
        "amountAfterEditing": amountAfterEditing,
        "maxSingleTransAmount": maxSingleTransAmount,
        "minSingleTransAmount": minSingleTransAmount,
        "buyerKycLimit": buyerKycLimit,
        "buyerRegDaysLimit": buyerRegDaysLimit,
        "buyerBtcPositionLimit": buyerBtcPositionLimit,
        "remarks": remarks,
        "autoReplyMsg": autoReplyMsg,
        "payTimeLimit": payTimeLimit,
        "tradeMethods": tradeMethods == null
            ? []
            : List<dynamic>.from(tradeMethods!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "userTradeCountFilterTime": userTradeCountFilterTime,
        "userBuyTradeCountMin": userBuyTradeCountMin,
        "userBuyTradeCountMax": userBuyTradeCountMax,
        "userSellTradeCountMin": userSellTradeCountMin,
        "userSellTradeCountMax": userSellTradeCountMax,
        "userAllTradeCountMin": userAllTradeCountMin,
        "userAllTradeCountMax": userAllTradeCountMax,
        "userTradeCompleteRateFilterTime": userTradeCompleteRateFilterTime,
        "userTradeCompleteCountMin": userTradeCompleteCountMin,
        "userTradeCompleteRateMin": userTradeCompleteRateMin,
        "userTradeVolumeFilterTime": userTradeVolumeFilterTime,
        "userTradeType": userTradeType,
        "userTradeVolumeMin": userTradeVolumeMin,
        "userTradeVolumeMax": userTradeVolumeMax,
        "userTradeVolumeAsset": userTradeVolumeAsset,
        "createTime": createTime,
        "advUpdateTime": advUpdateTime,
        "fiatVo": fiatVo,
        "assetVo": assetVo,
        "advVisibleRet": advVisibleRet,
        "assetLogo": assetLogo,
        "assetScale": assetScale,
        "fiatScale": fiatScale,
        "priceScale": priceScale,
        "fiatSymbol": fiatSymbol,
        "isTradable": isTradable,
        "dynamicMaxSingleTransAmount": dynamicMaxSingleTransAmount,
        "minSingleTransQuantity": minSingleTransQuantity,
        "maxSingleTransQuantity": maxSingleTransQuantity,
        "dynamicMaxSingleTransQuantity": dynamicMaxSingleTransQuantity,
        "tradableQuantity": tradableQuantity,
        "commissionRate": commissionRate,
        "tradeMethodCommissionRates": tradeMethodCommissionRates == null
            ? []
            : List<dynamic>.from(tradeMethodCommissionRates!.map((x) => x)),
        "launchCountry": launchCountry,
        "abnormalStatusList": abnormalStatusList,
        "closeReason": closeReason,
      };
}

class Advertiser {
  Advertiser({
    this.userNo,
    this.realName,
    this.nickName,
    this.margin,
    this.marginUnit,
    this.orderCount,
    this.monthOrderCount,
    this.monthFinishRate,
    this.advConfirmTime,
    this.email,
    this.registrationTime,
    this.mobile,
    this.userType,
    this.tagIconUrls,
    this.userGrade,
    this.userIdentity,
    this.proMerchant,
    this.isBlocked,
  });

  String? userNo;
  dynamic realName;
  String? nickName;
  dynamic margin;
  dynamic marginUnit;
  dynamic orderCount;
  int? monthOrderCount;
  double? monthFinishRate;
  dynamic advConfirmTime;
  dynamic email;
  dynamic registrationTime;
  dynamic mobile;
  String? userType;
  List<dynamic>? tagIconUrls;
  int? userGrade;
  String? userIdentity;
  dynamic proMerchant;
  dynamic isBlocked;

  factory Advertiser.fromJson(Map<String, dynamic> json) => Advertiser(
        userNo: json["userNo"],
        realName: json["realName"],
        nickName: json["nickName"],
        margin: json["margin"],
        marginUnit: json["marginUnit"],
        orderCount: json["orderCount"],
        monthOrderCount: json["monthOrderCount"],
        monthFinishRate: json["monthFinishRate"]?.toDouble(),
        advConfirmTime: json["advConfirmTime"],
        email: json["email"],
        registrationTime: json["registrationTime"],
        mobile: json["mobile"],
        userType: json["userType"],
        tagIconUrls: json["tagIconUrls"] == null
            ? []
            : List<dynamic>.from(json["tagIconUrls"]!.map((x) => x)),
        userGrade: json["userGrade"],
        userIdentity: json["userIdentity"],
        proMerchant: json["proMerchant"],
        isBlocked: json["isBlocked"],
      );

  Map<String, dynamic> toJson() => {
        "userNo": userNo,
        "realName": realName,
        "nickName": nickName,
        "margin": margin,
        "marginUnit": marginUnit,
        "orderCount": orderCount,
        "monthOrderCount": monthOrderCount,
        "monthFinishRate": monthFinishRate,
        "advConfirmTime": advConfirmTime,
        "email": email,
        "registrationTime": registrationTime,
        "mobile": mobile,
        "userType": userType,
        "tagIconUrls": tagIconUrls == null
            ? []
            : List<dynamic>.from(tagIconUrls!.map((x) => x)),
        "userGrade": userGrade,
        "userIdentity": userIdentity,
        "proMerchant": proMerchant,
        "isBlocked": isBlocked,
      };
}
