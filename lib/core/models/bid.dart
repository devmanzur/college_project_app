import 'package:snapkart_app/application/dto/bid_items_response.dart';

class Bid {
  int id;
  String createdAt;
  String imageUrl;
  String description;
  num price;
  String createdBy;
  String userImageUrl;

  Bid(this.id, this.createdAt, this.imageUrl, this.description, this.price,
      this.createdBy, this.userImageUrl);
  
  Bid.from(BidItemBody response){
    this.id = response.id;
    this.createdAt = response.createdAt;
    this.imageUrl = response.imageUrl;
    this.description = response.description;
    this.price = response.price;
    this.createdBy = response.createdBy;
    this.userImageUrl = response.userImageUrl;
  }
}
