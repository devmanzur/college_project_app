class Category{
  final int id;
  final String name;
  final String imageUrl;

  Category(this.id, this.name,this.imageUrl);

  @override
  bool operator ==(Object other) => other is Category && other.id == id;

  @override
  int get hashCode => name.hashCode;
}