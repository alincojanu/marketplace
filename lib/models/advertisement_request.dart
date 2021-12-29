class AdvertisementRequest extends Object {
  int pageNumber;
  int pageSize;

  AdvertisementRequest({required this.pageNumber, required this.pageSize});

  Map<String,String> toJson() {
    return {
      'pageNumber': pageNumber.toString(),
      'pageSize': pageSize.toString(),
    };
  }
}
