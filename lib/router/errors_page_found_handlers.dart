import 'package:admin_dashboard/ui/views/no_page.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlres {
  static Handler noPageFoundView = Handler(
    handlerFunc: (context, params) {
      return NoPageFoundView();
    },
  );
}
