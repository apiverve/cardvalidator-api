/// Response models for the Card Validator API.

/// API Response wrapper.
class CardvalidatorResponse {
  final String status;
  final dynamic error;
  final CardvalidatorData? data;

  CardvalidatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory CardvalidatorResponse.fromJson(Map<String, dynamic> json) => CardvalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CardvalidatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Card Validator API.

class CardvalidatorData {
  CardvalidatorDataCard? card;
  String? cardNumber;
  bool? isValid;

  CardvalidatorData({
    this.card,
    this.cardNumber,
    this.isValid,
  });

  factory CardvalidatorData.fromJson(Map<String, dynamic> json) => CardvalidatorData(
      card: json['card'] != null ? CardvalidatorDataCard.fromJson(json['card']) : null,
      cardNumber: json['cardNumber'],
      isValid: json['isValid'],
    );
}

class CardvalidatorDataCard {
  String? niceType;
  String? type;
  List<int>? patterns;
  List<int>? gaps;
  List<int>? lengths;
  CardvalidatorDataCardCode? code;
  int? matchStrength;

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
      patterns: (json['patterns'] as List?)?.cast<int>(),
      gaps: (json['gaps'] as List?)?.cast<int>(),
      lengths: (json['lengths'] as List?)?.cast<int>(),
      code: json['code'] != null ? CardvalidatorDataCardCode.fromJson(json['code']) : null,
      matchStrength: json['matchStrength'],
    );
}

class CardvalidatorDataCardCode {
  String? name;
  int? size;

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
