class ConversionData {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Bpi bpi;

  ConversionData({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory ConversionData.fromJson(Map<String, dynamic> json) {
    return ConversionData(
      time: Time.fromJson(json['time']),
      disclaimer: json['disclaimer'],
      chartName: json['chartName'],
      bpi: Bpi.fromJson(json['bpi']),
    );
  }
}

class Time {
  final String updated;
  final String updatedISO;
  final String updatedUK;

  Time({
    required this.updated,
    required this.updatedISO,
    required this.updatedUK,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      updated: json['updated'],
      updatedISO: json['updatedISO'],
      updatedUK: json['updateduk'],
    );
  }
}

class Bpi {
  final Currency usd;
  final Currency gbp;
  final Currency eur;

  Bpi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) {
    return Bpi(
      usd: Currency.fromJson(json['USD']),
      gbp: Currency.fromJson(json['GBP']),
      eur: Currency.fromJson(json['EUR']),
    );
  }
}

class Currency {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Currency({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'],
      symbol: json['symbol'],
      rate: json['rate'],
      description: json['description'],
      rateFloat: json['rate_float'].toDouble(),
    );
  }
}
