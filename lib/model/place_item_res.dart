class PlaceItemRes {
  String name;
  String address;
  String lat;
  String lng;
  PlaceItemRes(this.name, this.address, this.lat, this.lng);

  static List<PlaceItemRes> fromJson(Map<String, dynamic> json) {
    List<PlaceItemRes> rs = List as List<PlaceItemRes>;

    var results = json['results'] as List;
    for (var item in results) {
      var p = PlaceItemRes(
        item['name'],
        item['formatted-address'],
        item['geometry']['location']['lat'],
        item['geometry']['location']['lng'],
      );

      rs.add(p);
    }
    return rs;
  }
}