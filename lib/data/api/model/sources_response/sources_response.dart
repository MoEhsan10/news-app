import 'package:news_app/data/api/model/sources_response/sources.dart';

class SourcesResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourcesResponse({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }


  // SourcesResponse copyWith({
  //   String? status,
  //   List<Source>? sources,
  // }) =>
  //     SourcesResponse(
  //       status: status ?? this.status,
  //       sources: sources ?? this.sources,
  //     );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}