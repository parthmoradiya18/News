class NewsModel {
  final List news;
  final List sportsNews;
  final List businessNews;
  final List entertainmentNews;
  final List healthNews;
  final List scienceNews;
  final List technologyNews;

  NewsModel({
    required this.news,
    required this.sportsNews,
    required this.businessNews,
    required this.entertainmentNews,
    required this.healthNews,
    required this.scienceNews,
    required this.technologyNews,
  });

  factory NewsModel.fromJson({required Map data}) {
    return NewsModel(
      news: data['articles'],
      sportsNews: data['articles'],
      businessNews: data['articles'],
      entertainmentNews: data['articles'],
      healthNews: data['articles'],
      scienceNews: data['articles'],
      technologyNews: data['articles'],
    );
  }
}