import 'package:snapkart_app/core/models/bid.dart';
import 'package:snapkart_app/core/models/snap_query.dart';

class QueryProvider {
  static final QueryProvider _singleton = QueryProvider._internal();

  factory QueryProvider() => _singleton;

  QueryProvider._internal();

  List<SnapQuery> getQueries() {
    return [
      SnapQuery(
          id: 1,
          createdBy: "Noushad",
          areaId: 1,
          cityId: 1,
          description: "Dummy post",
          imageUrl:
              "https://vcahospitals.com/-/media/vca/images/lifelearn-images-foldered/753/dog_cone_surgery.png?la=en&hash=1BA4EB05EF60AD493AFD2DAC91A61AB0",
          categoryId: 14,
          createdAt: "02 January, 2021",
          likes: 4,
          bids: 2,
          userImageUrl: "http://i.imgur.com/74sByqd.jpg",
          location: "Dhanmondi, Dhaka"),
      SnapQuery(
          id: 2,
          createdBy: "Noushad",
          areaId: 1,
          cityId: 1,
          description: "Dummy post",
          imageUrl:
              "https://vcahospitals.com/-/media/vca/images/lifelearn-images-foldered/753/dog_cone_surgery.png?la=en&hash=1BA4EB05EF60AD493AFD2DAC91A61AB0",
          categoryId: 14,
          createdAt: "02 January, 2021",
          likes: 4,
          bids: 2,
          userImageUrl: "http://i.imgur.com/74sByqd.jpg",
          location: "Dhanmondi, Dhaka"),
      SnapQuery(
          id: 3,
          createdBy: "Noushad",
          areaId: 1,
          cityId: 1,
          description: "Dummy post",
          imageUrl:
              "https://vcahospitals.com/-/media/vca/images/lifelearn-images-foldered/753/dog_cone_surgery.png?la=en&hash=1BA4EB05EF60AD493AFD2DAC91A61AB0",
          categoryId: 14,
          createdAt: "02 January, 2021",
          likes: 4,
          bids: 2,
          userImageUrl: "http://i.imgur.com/74sByqd.jpg",
          location: "Dhanmondi, Dhaka"),
      SnapQuery(
          id: 4,
          createdBy: "Noushad",
          areaId: 1,
          cityId: 1,
          description: "Dummy post",
          imageUrl:
              "https://vcahospitals.com/-/media/vca/images/lifelearn-images-foldered/753/dog_cone_surgery.png?la=en&hash=1BA4EB05EF60AD493AFD2DAC91A61AB0",
          categoryId: 14,
          createdAt: "02 January, 2021",
          likes: 4,
          bids: 2,
          userImageUrl: "http://i.imgur.com/74sByqd.jpg",
          location: "Dhanmondi, Dhaka"),
      SnapQuery(
          id: 5,
          createdBy: "Noushad",
          areaId: 1,
          cityId: 1,
          description: "Dummy post",
          imageUrl:
              "https://vcahospitals.com/-/media/vca/images/lifelearn-images-foldered/753/dog_cone_surgery.png?la=en&hash=1BA4EB05EF60AD493AFD2DAC91A61AB0",
          categoryId: 14,
          createdAt: "02 January, 2021",
          likes: 4,
          bids: 2,
          userImageUrl: "http://i.imgur.com/74sByqd.jpg",
          location: "Dhanmondi, Dhaka"),
    ];
  }

  List<Bid> getBids() {
    return [
      Bid(
          1,
          "02 Jan",
          "https://ravenleatherz.com/wp-content/uploads/2019/08/Brown-Leather-Dog-Collar-for-pets-in-Bangladesh.jpg",
          "Soft collar for you dog",
          200,
          "Rima",
          "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg"),
      Bid(
          2,
          "02 Jan",
          "https://ravenleatherz.com/wp-content/uploads/2019/08/Brown-Leather-Dog-Collar-for-pets-in-Bangladesh.jpg",
          "Soft collar for you dog",
          200,
          "Rima",
          "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg"),
      Bid(
          4,
          "02 Jan",
          "https://ravenleatherz.com/wp-content/uploads/2019/08/Brown-Leather-Dog-Collar-for-pets-in-Bangladesh.jpg",
          "Soft collar for you dog",
          200,
          "Rima",
          "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg"),
      Bid(
          5,
          "02 Jan",
          "https://ravenleatherz.com/wp-content/uploads/2019/08/Brown-Leather-Dog-Collar-for-pets-in-Bangladesh.jpg",
          "Soft collar for you dog",
          200,
          "Rima",
          "http://www.venmond.com/demo/vendroid/img/avatar/big.jpg"),
    ];
  }
}
