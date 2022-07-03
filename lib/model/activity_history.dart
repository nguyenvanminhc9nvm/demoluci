class ActivityHistory {
  final int id;
  final String description;
  final String createdAt;

  ActivityHistory(this.id, this.description, this.createdAt);

  factory ActivityHistory.fromJson(dynamic json) {
    return ActivityHistory(
      json['id'] as int,
      json["description"] as String,
      json['created_at'] as String,
    );
  }
}
