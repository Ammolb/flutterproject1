Map<String, String> marathiStrings = {
  'home': 'होम',
  'drawer_header': 'ड्रॉव्हर हेडर',
  'item_1': 'आयटम 1',
  'item_2': 'आयटम 2',
  'change_language': 'भाषा बदला',
  'add': 'जोडा',
  'settings': 'सेटिंग्ज',
};

String getLocalizedString(String key) {
  return marathiStrings[key] ?? '';
}
