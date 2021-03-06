import 'package:models_base/src/base/herder_base.dart';
import 'package:models_base/utils.dart';

extension PrettyString<H extends HerderAbstract> on Map<String, H> {
  String mapToPrettyString() {
    List<String> reversedList = [];
    forEach((key, value) {
      reversedList.add(numFormat.format(int.parse(key)));
    });
    return reversedList.toString().replaceAll('[', '').replaceAll(']', '');
  }
}
