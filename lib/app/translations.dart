import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Home': 'Martfury',
          'Cart': 'Cart',
          'Favorites': 'Favorites',
          'Notifications': 'Notifications',
          'Settings': 'Settings',
        },
      };
}
