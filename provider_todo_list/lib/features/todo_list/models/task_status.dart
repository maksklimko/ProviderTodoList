enum TaskStatus {
  todo,
  completed;

  String toJson() => name;

  static TaskStatus fromJson(String json) => values.byName(json);
}
