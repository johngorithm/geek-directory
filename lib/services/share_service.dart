
import 'package:share/share.dart';

abstract class AbstractShareService {
  Future<void> share(String text, {String subject});
}

class ShareService implements AbstractShareService {
  @override
  Future<void> share(String text, {String subject}) {
    return Share.share(text, subject: subject);
  }
}
