class Check {
  bool isValidWebsiteUrl(String url) {
    var reg =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
    print(RegExp(reg).hasMatch('https://aaa.abc.com'));
    return RegExp(reg).hasMatch(url);
  }
}
