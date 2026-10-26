/// Response models for the Card Validator API.

/// API Response wrapper.
class CardvalidatorResponse {
  final String status;
  final dynamic error;
  final CardvalidatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CardvalidatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CardvalidatorResponse.fromJson(Map<String, dynamic> json) => CardvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CardvalidatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Card Validator API.

class CardvalidatorData {
  CardvalidatorDataCard? card;
  String? brand;
  String? cardNumber;
  String? bin;
  String? last4;
  bool? isValid;
  bool? isPotentiallyValid;
  bool? isTestCard;
  num? riskScore;
  String? riskLevel;

  CardvalidatorData({
    this.card,
    this.brand,
    this.cardNumber,
    this.bin,
    this.last4,
    this.isValid,
    this.isPotentiallyValid,
    this.isTestCard,
    this.riskScore,
    this.riskLevel,
  });

  factory CardvalidatorData.fromJson(Map<String, dynamic> json) => CardvalidatorData(
      card: json['card'] != null ? CardvalidatorDataCard.fromJson(json['card']) : null,
      brand: json['brand'],
      cardNumber: json['cardNumber'],
      bin: json['bin'],
      last4: json['last4'],
      isValid: json['isValid'],
      isPotentiallyValid: json['isPotentiallyValid'],
      isTestCard: json['isTestCard'],
      riskScore: json['riskScore'],
      riskLevel: json['riskLevel'],
    );
}

class CardvalidatorDataCard {
  String? niceType;
  String? type;
  List<num>? patterns;
  List<num>? gaps;
  List<num>? lengths;
  CardvalidatorDataCardCode? code;
  num? matchStrength;

  CardvalidatorDataCard({
    this.niceType,
    this.type,
    this.patterns,
    this.gaps,
    this.lengths,
    this.code,
    this.matchStrength,
  });

  factory CardvalidatorDataCard.fromJson(Map<String, dynamic> json) => CardvalidatorDataCard(
      niceType: json['niceType'],
      type: json['type'],
      patterns: (json['patterns'] as List?)?.cast<num>(),
      gaps: (json['gaps'] as List?)?.cast<num>(),
      lengths: (json['lengths'] as List?)?.cast<num>(),
      code: json['code'] != null ? CardvalidatorDataCardCode.fromJson(json['code']) : null,
      matchStrength: json['matchStrength'],
    );
}

class CardvalidatorDataCardCode {
  String? name;
  num? size;

  CardvalidatorDataCardCode({
    this.name,
    this.size,
  });

  factory CardvalidatorDataCardCode.fromJson(Map<String, dynamic> json) => CardvalidatorDataCardCode(
      name: json['name'],
      size: json['size'],
    );
}

class CardvalidatorRequest {
  String number;

  CardvalidatorRequest({
    required this.number,
  });

  Map<String, dynamic> toJson() => {
      'number': number,
    };
}
