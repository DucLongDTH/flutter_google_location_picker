class AddressModel {
  AddressModel({
    required this.city,
    required this.village,
    required this.county,
    required this.state,
    required this.subDistrict,
    required this.country,
    required this.countryCode,
  });

  String city;
  String village;
  String county;
  String subDistrict;
  String state;
  String country;
  String countryCode;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      village: json["village"] ?? "",
      county: json["county"] ?? "",
      city: json["city"] ?? "",
      subDistrict: json["subdistrict"] ?? "",
      state: json["state"] ?? "",
      country: json["country"] ?? "",
      countryCode: json["country_code"] ?? "");

  Map<String, dynamic> toJson() => {
        "city": city,
        "village": village,
        "county": county,
        "subdistrict": subDistrict,
        "state": state,
        "country": country,
        "country_code": countryCode
      };
}
