import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'offices.g.dart';

@JsonSerializable()
class OfficesList {
  final List<Office> offices;

  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    return _$OfficesListFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OfficesListToJson(this);
  }
}

@JsonSerializable()
class Office {
  final String name;
  final String address;
  final String image;

  Office({required this.name, required this.address, required this.image});

  factory Office.fromJson(Map<String, dynamic> json) {
    return _$OfficeFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OfficeToJson(this);
  }
}

Future<OfficesList> loadOffices() async {
  const apiUrl = 'https://about.google/static/data/locations.json';

  final result = await http.get(Uri.parse(apiUrl));

  if (result.statusCode == 200) {
    final data = jsonDecode(result.body);

    return OfficesList.fromJson(data);
  }

  throw Exception('Server error: ${result.statusCode} ${result.reasonPhrase}');
}
