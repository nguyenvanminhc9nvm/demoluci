class Project {
  final int? id;
  final String? name;
  final String? rolePermission;

  Project(this.id, this.name, this.rolePermission);

  factory Project.fromJson(dynamic json) {
    return Project(
      json["id"] as int?,
      json["name"] as String?,
      json["role_permission"] as String?,
    );
  }
}
