enum SortType {
  latest('최신 순'),
  unread('안 읽은 메시지 순'),
  favorite('즐겨찾기 순');

  final String text;

  const SortType(this.text);
}
