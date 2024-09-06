import '../../Popular/model/PopularMoviesModel.dart';

class NewReleaseModel {
  NewReleaseModel({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,});

  NewReleaseModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;


}


class Dates {
  Dates({
    this.maximum,
    this.minimum,});

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
  String? maximum;
  String? minimum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }

}