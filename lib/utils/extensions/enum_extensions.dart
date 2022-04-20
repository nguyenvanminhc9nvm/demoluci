extension EnumExtensions on Enum {
  String get text => this.toString().split('.').last;
}
