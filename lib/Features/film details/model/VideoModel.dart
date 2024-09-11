/// id : 5494
/// results : [{"iso_639_1":"en","iso_3166_1":"US","name":"2021 UK Trailer","key":"GM7e5nEcNHw","site":"YouTube","size":1080,"type":"Trailer","official":true,"published_at":"2021-03-29T09:00:54.000Z","id":"60760e0319ab590040612089"},{"iso_639_1":"en","iso_3166_1":"US","name":"US Trailer","key":"dgfF7lZa9R4","site":"YouTube","size":480,"type":"Trailer","official":true,"published_at":"2011-08-04T19:39:21.000Z","id":"61eda08fe48860001eff35d9"}]
library;

class VideoModel {
  VideoModel({
      this.id, 
      this.results,});

  VideoModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  int? id;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// name : "2021 UK Trailer"
/// key : "GM7e5nEcNHw"
/// site : "YouTube"
/// size : 1080
/// type : "Trailer"
/// official : true
/// published_at : "2021-03-29T09:00:54.000Z"
/// id : "60760e0319ab590040612089"

class Results {
  Results({
      this.iso6391, 
      this.iso31661, 
      this.name, 
      this.key, 
      this.site, 
      this.size, 
      this.type, 
      this.official, 
      this.publishedAt, 
      this.id,});

  Results.fromJson(dynamic json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['published_at'] = publishedAt;
    map['id'] = id;
    return map;
  }

}