class SearchResult {
  int rawDocsCount;
  int rawDocsSearchTime;
  int reRankSearchTime;
  bool cacheHit;
  int trial;
  List<Docs> docs;
  int limit;
  int limitTtl;
  int quota;
  int quotaTtl;

  SearchResult(
      {this.rawDocsCount,
      this.rawDocsSearchTime,
      this.reRankSearchTime,
      this.cacheHit,
      this.trial,
      this.docs,
      this.limit,
      this.limitTtl,
      this.quota,
      this.quotaTtl});

  SearchResult.fromJson(Map<String, dynamic> json) {
    rawDocsCount = json['RawDocsCount'];
    rawDocsSearchTime = json['RawDocsSearchTime'];
    reRankSearchTime = json['ReRankSearchTime'];
    cacheHit = json['CacheHit'];
    trial = json['trial'];
    if (json['docs'] != null) {
      docs = List<Docs>();
      json['docs'].forEach((v) {
        docs.add(Docs.fromJson(v));
      });
    }
    limit = json['limit'];
    limitTtl = json['limit_ttl'];
    quota = json['quota'];
    quotaTtl = json['quota_ttl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['RawDocsCount'] = this.rawDocsCount;
    data['RawDocsSearchTime'] = this.rawDocsSearchTime;
    data['ReRankSearchTime'] = this.reRankSearchTime;
    data['CacheHit'] = this.cacheHit;
    data['trial'] = this.trial;
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['limit_ttl'] = this.limitTtl;
    data['quota'] = this.quota;
    data['quota_ttl'] = this.quotaTtl;
    return data;
  }
}

class Docs {
  double from;
  double to;
  int anilistId;
  double at;
  String season;
  String anime;
  String filename;
  int episode;
  String tokenthumb;
  double similarity;
  String title;
  String titleNative;
  String titleChinese;
  String titleEnglish;
  String titleRomaji;
  int malId;
  List<String> synonyms;
  List<String> synonymsChinese;
  bool isAdult;

  Docs(
      {this.from,
      this.to,
      this.anilistId,
      this.at,
      this.season,
      this.anime,
      this.filename,
      this.episode,
      this.tokenthumb,
      this.similarity,
      this.title,
      this.titleNative,
      this.titleChinese,
      this.titleEnglish,
      this.titleRomaji,
      this.malId,
      this.synonyms,
      this.synonymsChinese,
      this.isAdult});

  Docs.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    anilistId = json['anilist_id'];
    at = json['at'];
    season = json['season'];
    anime = json['anime'];
    filename = json['filename'];
    episode = json['episode'];
    tokenthumb = json['tokenthumb'];
    similarity = json['similarity'];
    title = json['title'];
    titleNative = json['title_native'];
    titleChinese = json['title_chinese'];
    titleEnglish = json['title_english'];
    titleRomaji = json['title_romaji'];
    malId = json['mal_id'];
    synonyms = json['synonyms'].cast<String>();
    synonymsChinese = json['synonyms_chinese'].cast<String>();
    isAdult = json['is_adult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['anilist_id'] = this.anilistId;
    data['at'] = this.at;
    data['season'] = this.season;
    data['anime'] = this.anime;
    data['filename'] = this.filename;
    data['episode'] = this.episode;
    data['tokenthumb'] = this.tokenthumb;
    data['similarity'] = this.similarity;
    data['title'] = this.title;
    data['title_native'] = this.titleNative;
    data['title_chinese'] = this.titleChinese;
    data['title_english'] = this.titleEnglish;
    data['title_romaji'] = this.titleRomaji;
    data['mal_id'] = this.malId;
    data['synonyms'] = this.synonyms;
    data['synonyms_chinese'] = this.synonymsChinese;
    data['is_adult'] = this.isAdult;
    return data;
  }
}
