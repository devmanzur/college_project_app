class City {
  final String name;
  final int id;

  City(this.id,this.name);

  @override
  bool operator ==(Object other) => other is City && other.id == id;

  @override
  int get hashCode => name.hashCode;
}