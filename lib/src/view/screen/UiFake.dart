import 'dart:ui' as ui;

class platformViewRegistry {
  static registerViewFactory(String viewId, dynamic cb) {
    ui.platformViewRegistry.registerViewFactory(viewId, cb);
  }
}
