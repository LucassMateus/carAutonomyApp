import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CarModel {
  final String name;
  final String brand;
  final int year;
  final double urbanConsum;
  final double highwayConsum;
  
  CarModel({
    required this.name,
    required this.brand,
    required this.year,
    required this.urbanConsum,
    required this.highwayConsum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'brand': brand,
      'year': year,
      'urbanConsum': urbanConsum,
      'highwayConsum': highwayConsum,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      name: map['name'] as String,
      brand: map['brand'] as String,
      year: map['year'] as int,
      urbanConsum: map['urbanConsum'] as double,
      highwayConsum: map['highwayConsum'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarModel(name: $name, brand: $brand, year: $year, urbanConsum: $urbanConsum, highwayConsum: $highwayConsum)';
  }
}
