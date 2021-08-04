class SearchResult {
  late int frameCount;
  late String error;
  late List<Result>? result;

  SearchResult({required this.frameCount, required this.error, this.result});

  SearchResult.fromJson(Map<String, dynamic> json) {
    frameCount = json['frameCount'];
    error = json['error'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['frameCount'] = this.frameCount;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  late Anilist? anilist;
  late String filename;
  late int? episode;
  late double from;
  late double to;
  late double similarity;
  late String video;
  late String image;

  Result(
      {required this.anilist,
      required this.filename,
      required this.episode,
      required this.from,
      required this.to,
      required this.similarity,
      required this.video,
      required this.image});

  Result.fromJson(Map<String, dynamic> json) {
    anilist =
        json['anilist'] != null ? Anilist.fromJson(json['anilist']) : null;
    filename = json['filename'];
    episode = json['episode'];
    from = json['from'];
    to = json['to'];
    similarity = json['similarity'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.anilist != null) {
      data['anilist'] = this.anilist!.toJson();
    }
    data['filename'] = this.filename;
    data['episode'] = this.episode;
    data['from'] = this.from;
    data['to'] = this.to;
    data['similarity'] = this.similarity;
    data['video'] = this.video;
    data['image'] = this.image;
    return data;
  }
}

class Anilist {
  late int id;
  late int? idMal;
  late Title? title;
  late List<String> synonyms;
  late bool isAdult;

  Anilist(
      {required this.id,
      required this.idMal,
      required this.title,
      required this.synonyms,
      required this.isAdult});

  Anilist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idMal = json['idMal'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    synonyms = json['synonyms'].cast<String>();
    isAdult = json['isAdult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['idMal'] = this.idMal;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['synonyms'] = this.synonyms;
    data['isAdult'] = this.isAdult;
    return data;
  }
}

class Title {
  late String? native;
  late String? romaji;
  late String? english;

  Title({required this.native, required this.romaji, required this.english});

  Title.fromJson(Map<String, dynamic> json) {
    native = json['native'];
    romaji = json['romaji'];
    english = json['english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['native'] = this.native;
    data['romaji'] = this.romaji;
    data['english'] = this.english;
    return data;
  }
}
