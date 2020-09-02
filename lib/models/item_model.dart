class ItemModel {
  String imageUrl;
  String title;
  String subtitle;

  ItemModel({this.imageUrl, this.subtitle, this.title});

  ItemModel.fromJson(json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
}
