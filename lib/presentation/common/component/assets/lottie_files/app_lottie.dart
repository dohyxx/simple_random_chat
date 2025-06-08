class AppLottie {
  static const String _basePath = 'assets/lotties';

  static String getPath(String fileName) => _basePath + fileName;

  static final String complete = getPath('/complete.json');
  static final String loading = getPath('/loading.json');
}
