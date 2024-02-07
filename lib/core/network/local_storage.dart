import 'package:flutter_application_2/features/model/task_model.dart';
import 'package:flutter_application_2/features/profile/upload_view.dart';
import 'package:hive/hive.dart';

class Applocal {
  static String IMAGE_KEY = 'IMAGE';
  static String NAME_KEY = 'NAME';
  static String ISUPLOAD_KEY = 'ISUPLOAD';

  static cashData(String key, value) {
    var box = Hive.box('user');
    box.put(key, value);
  }

  static dynamic getData(String key) {
    var box = Hive.box('user');
    return box.get(key);
  }

  
}
