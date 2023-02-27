import 'dart:convert';
/// time : "4"
/// name : "Hanford"
/// avatar : "https://loremflickr.com/640/480/city"
/// price : "440.00"
/// id : "1"

TravelList travelListFromJson(String str) => TravelList.fromJson(json.decode(str));
String travelListToJson(TravelList data) => json.encode(data.toJson());
class TravelList {
  TravelList({
      String? time, 
      String? name, 
      String? avatar, 
      String? price, 
      String? id,}){
    _time = time;
    _name = name;
    _avatar = avatar;
    _price = price;
    _id = id;
}

  TravelList.fromJson(dynamic json) {
    _time = json['time'];
    _name = json['name'];
    _avatar = json['avatar'];
    _price = json['price'];
    _id = json['id'];
  }
  String? _time;
  String? _name;
  String? _avatar;
  String? _price;
  String? _id;
TravelList copyWith({  String? time,
  String? name,
  String? avatar,
  String? price,
  String? id,
}) => TravelList(  time: time ?? _time,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
  price: price ?? _price,
  id: id ?? _id,
);
  String? get time => _time;
  String? get name => _name;
  String? get avatar => _avatar;
  String? get price => _price;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['price'] = _price;
    map['id'] = _id;
    return map;
  }

}