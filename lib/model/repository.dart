class Repository {
  final String name;
  final String userIconPath;
  final String language;
  final int star;
  final int watcher;
  final int fork;
  final int issue;

  Repository(
      {required this.name,
      required this.userIconPath,
      required this.language,
      required this.star,
      required this.watcher,
      required this.fork,
      required this.issue});
  factory Repository.fromSearhRepositoryItem(dynamic item) {
    try {
      return Repository(
          name: item["name"],
          userIconPath: item["owner"]["avatar_url"],
          language: item["language"],
          star: int.parse(item["stargazers_count"]),
          watcher: int.parse(item["watchers"]),
          fork: int.parse(item["forks"]),
          issue: int.parse(item["open_issues"]));
    } catch (e) {
      throw Exception();
    }
  }
}
