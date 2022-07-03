class Role {
  final int? id;
  final String? name;
  final String? department;
  final int? permission;

  Role(this.id, this.name, this.department, this.permission);

  factory Role.fromJson(dynamic json) {
    return Role(
      json['id'] as int?,
      json["name"] as String?,
      json["department"] as String?,
      json["permission"] as int?,
    );
  }
}
