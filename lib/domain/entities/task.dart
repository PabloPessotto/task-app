import 'package:taskforme/domain/entities/label.dart';

class Task {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? status;
  String? date;
  List<Label>? labels;

  Task(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.status,
      this.date,
      this.labels});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "description": description,
      "status": status,
      "date": date,
      "labels": labels,
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
      labels: json["labels"],
    );
  }
}
