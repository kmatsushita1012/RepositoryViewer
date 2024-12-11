
enum SortTypes {
  stars,
  forks,
  isuues,
  updated;

  String toString() {
    if (this == SortTypes.isuues) {
      return "help-wanted-issues";
    } else {
      return name;
    }
  }
}
