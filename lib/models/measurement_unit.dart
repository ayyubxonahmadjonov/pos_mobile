/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 7/28/2025, 10:28 AM
*/



class MeasurementUnit {
  MeasurementUnit({
    this.id,
    this.shortName,
    this.longName,
    this.isDeletable,
    this.createdAt,
    this.precision,
    this.createdBy,
    this.longNameTranslation,
    this.shortNameTranslation,
  });

  final String? id;
  final String? shortName;
  final String? longName;
  final bool? isDeletable;
  final String? createdAt;
  final dynamic precision;
  final dynamic createdBy;
  final NameTranslation? longNameTranslation;
  final NameTranslation? shortNameTranslation;

  factory MeasurementUnit.fromJson(Map<String, dynamic> json) {
    return MeasurementUnit(
      id: json["id"],
      shortName: json["short_name"],
      longName: json["long_name"],
      isDeletable: json["is_deletable"],
      createdAt: json["created_at"],
      precision: json["precision"],
      createdBy: json["created_by"],
      longNameTranslation: json["long_name_translation"] == null
          ? null
          : NameTranslation.fromJson(json["long_name_translation"]),
      shortNameTranslation: json["short_name_translation"] == null
          ? null
          : NameTranslation.fromJson(json["short_name_translation"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "short_name": shortName,
        "long_name": longName,
        "is_deletable": isDeletable,
        "created_at": createdAt,
        "precision": precision,
        "created_by": createdBy,
        "long_name_translation": longNameTranslation?.toJson(),
        "short_name_translation": shortNameTranslation?.toJson(),
      };
}
/*
    @author Suxrob Sattorov and Ayyubxon Ahmadjonov, 7/28/2025, 10:28 AM
*/


class NameTranslation {
  String? en;
  String? ru;
  String? uz;

  NameTranslation({this.en, this.ru, this.uz});

  NameTranslation.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ru = json['ru'];
    uz = json['uz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['ru'] = ru;
    data['uz'] = uz;
    return data;
  }
}
