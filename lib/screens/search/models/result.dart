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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['frameCount'] = frameCount;
    data['error'] = error;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (anilist != null) {
      data['anilist'] = anilist!.toJson();
    }
    data['filename'] = filename;
    data['episode'] = episode;
    data['from'] = from;
    data['to'] = to;
    data['similarity'] = similarity;
    data['video'] = video;
    data['image'] = image;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idMal'] = idMal;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['synonyms'] = synonyms;
    data['isAdult'] = isAdult;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['native'] = native;
    data['romaji'] = romaji;
    data['english'] = english;
    return data;
  }
}
