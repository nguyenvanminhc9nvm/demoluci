class NotificationPayload {
  String? id;
  String? title;
  String? body;

  NotificationPayload({
    this.id,
    this.title,
    this.body,
  });

  NotificationPayload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
