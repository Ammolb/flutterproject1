
Map<String, String> hindiStrings = {
  'home': 'होम',
  'drawer_header': 'ड्रॉवर हेडर',
  'item_1': 'आइटम 1',
  'item_2': 'आइटम 2',
  'change_language': 'भाषा बदलें',
  'add': 'जोड़ें',
  'settings': 'सेटिंग्स',
};

String getLocalizedString(String key) {
  return hindiStrings[key] ?? '';
}
