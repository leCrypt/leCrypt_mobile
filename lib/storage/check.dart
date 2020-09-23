class Check {
  bool isValidWebsite(String website) {
    var reg = r'/^(https?):\/\/[^\s$.?#].[^\s]*$/i';
    return RegExp(reg).hasMatch(website);
  }
}
