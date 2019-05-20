

class FeedbackData {
  String locality, city, state, other;
  String duration;
  FeedbackData(this.locality, this.city, this.state, this.duration, this.other);
  /*_read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'data';
    final value = prefs.getInt(key) ?? 0;
    print('read: $value');
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'data';
    final value = 42;
    prefs.setInt(key, value);
    print('saved $value');
  }*/
}
