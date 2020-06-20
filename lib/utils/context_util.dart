
import 'package:flutter/widgets.dart';

class ContextUtil {
  static closeKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
