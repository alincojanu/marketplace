class Advertisement {
  String? id;
  String title;
  String description;
  double price;
  String image;
  String location;
  String owner;

  Advertisement(
      {required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.location,
      required this.owner,
      this.id});

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      location: json['location'],
      owner: json['owner'],
    );
  }
}
