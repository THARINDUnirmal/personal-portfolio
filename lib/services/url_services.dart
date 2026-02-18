import 'dart:html' as html;

class UrlServices {
  void openUrl(String url) {
    html.window.open(url, '_blank');
  }
}
