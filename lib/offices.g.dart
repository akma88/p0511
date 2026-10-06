// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices.dart';

OfficesList _$OfficesListFromJson(Map<String, dynamic> json) {
  return OfficesList(
    offices: (json['offices'] as List<dynamic>)
        .map((item) => Office.fromJson(item as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OfficesListToJson(OfficesList instance) {
  return {'offices': instance.offices.map((item) => item.toJson()).toList()};
}

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
    name: json['name'] as String,
    address: json['address'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$OfficeToJson(Office instance) {
  return {
    'name': instance.name,
    'address': instance.address,
    'image': instance.image,
  };
}
