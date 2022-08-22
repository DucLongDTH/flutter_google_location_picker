class LatLong {
  final double latitude;
  final double longitude;

  LatLong(this.latitude, this.longitude);
}

class PickedData {
  final LatLong latLong;
  final String address;

  const PickedData({
    required this.latLong,
    required this.address,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PickedData &&
          runtimeType == other.runtimeType &&
          latLong == other.latLong &&
          address == other.address);

  @override
  int get hashCode => latLong.hashCode ^ address.hashCode;

  @override
  String toString() {
    return 'PickedData{ latLong: $latLong, address: $address,}';
  }

  PickedData copyWith({
    LatLong? latLong,
    String? address,
  }) {
    return PickedData(
      latLong: latLong ?? this.latLong,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latLong': latLong,
      'address': address,
    };
  }

  factory PickedData.fromMap(Map<String, dynamic> map) {
    return PickedData(
      latLong: map['latLong'] as LatLong,
      address: map['address'] as String,
    );
  }
}
