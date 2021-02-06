class Area {
  final int cityId;
  final int id;
  final String name;

  Area(this.cityId, this.id, this.name);

  @override
  bool operator ==(Object other) => other is Area && other.id == id;

  @override
  int get hashCode => name.hashCode;
}
