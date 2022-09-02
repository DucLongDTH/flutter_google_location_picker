class AddressModel {
  AddressModel({
    required this.city,
    required this.village,
    required this.county,
    required this.state,
    required this.subDistrict,
    required this.country,
    required this.countryCode,
    required this.postCode,
    required this.locality,
    required this.houseNumber,
  });

  String city;
  String village;
  String county;
  String subDistrict;
  String state;
  String country;
  String countryCode;
  String postCode;
  String locality;
  String houseNumber;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      village: json["village"] ?? "",
      county: json["county"] ?? "",
      city: json["city"] ?? "",
      subDistrict: json["subdistrict"] ?? "",
      state: json["state"] ?? "",
      houseNumber: json["housenumber"] ?? "",
      country: json["country"] ?? "",
      locality: json["locality"] ?? "",
      postCode: json["postcode"] ?? "",
      countryCode: json["country_code"] ?? "");

  Map<String, dynamic> toJson() => {
        "city": city,
        "village": village,
        "county": county,
        "subdistrict": subDistrict,
        "state": state,
        "country": country,
        "locality": locality,
        "housenumber": houseNumber,
        "postcode": postCode,
        "country_code": countryCode
      };
}
