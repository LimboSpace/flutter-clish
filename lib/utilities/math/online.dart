timeLastOnline(DateTime lastOnline) {
  int seconds = DateTime.now().difference(lastOnline).inMinutes;

  return seconds;
}
