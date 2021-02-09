class Category{
  final int id;
  final String name;

  Category(this.id, this.name);

  @override
  bool operator ==(Object other) => other is Category && other.id == id;

  @override
  int get hashCode => name.hashCode;
}