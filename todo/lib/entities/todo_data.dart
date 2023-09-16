class TodoData {
  // int id;
  bool completed = false;
  String text;

  TodoData(this.text);

  void strike() {
    completed = completed ? false : true;
  }
}
