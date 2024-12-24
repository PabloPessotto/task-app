class Label {
  int? id;
  String? name;
  String? description;
  String? color;

  Label({this.id, this.name, this.description, this.color});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "color": color,
    };
  }

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      color: json["color"],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Label && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
