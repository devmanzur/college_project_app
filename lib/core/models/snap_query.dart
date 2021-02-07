class SnapQuery {
  int id;
  int areaId;
  int cityId;
  String description;
  String imageUrl;
  int categoryId;
  String createdAt;
  int likes;
  int bids;
  String createdBy;
  String userImageUrl;
  String location;

  SnapQuery({
    this.id,
    this.createdBy,
    this.areaId,
    this.cityId,
    this.description,
    this.imageUrl,
    this.categoryId,
    this.createdAt,
    this.likes,
    this.bids,
    this.userImageUrl,
    this.location,
  });
}
