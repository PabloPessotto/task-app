class Task {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? status;
  String? date;
  List<String>? label;

  Task(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.status,
      this.date,
      this.label});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "description": description,
      "status": status,
      "date": date,
      "label": label,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      date: json["date"],
      label: json["label"],
    );
  }
}
