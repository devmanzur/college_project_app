import 'package:snapkart_app/application/dto/time_line_item.dart';

class SnapQuery {
  int id;
  int areaId;
  int cityId;
  String description;
  String imageUrl;
  int categoryId;
  int acceptedBidId;
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

  SnapQuery.from(PostResponse response){
    this.id = response.id;
    this.areaId = response.areaId;
    this.cityId = response.cityId;
    this.description = response.description;
    this.imageUrl = response.imageUrl;
    this.categoryId = response.categoryId;
    this.acceptedBidId = response.acceptedBidId;
    this.createdAt = response.createdAt;
    this.likes = response.likes;
    this.bids = response.bids;
    this.createdBy = response.createdBy;
    this.userImageUrl = response.userImageUrl;
    this.location = response.location;
  }
}
