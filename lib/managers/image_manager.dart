class ImageMgr {
  static String getImage(String imageUrl, int width, int height) {
    const String httpsScheme = "https://";
    const String httpScheme = "http://";
    String url = "";

    String extention = ".${imageUrl.split('.').last}";

    if (!imageUrl.contains(httpsScheme) && !imageUrl.contains(httpScheme)) {
      url = "$httpsScheme$imageUrl";
      url = url.replaceFirst(extention, "_w${width}_h${height}_q75$extention");
    }
    return url;
  }
}
