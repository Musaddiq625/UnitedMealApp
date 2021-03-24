class Ad {
  int id;
  String deliveryTime;
  String btnText;
  String adText;
  // String imagePath;

  Ad({
    this.id,
    this.deliveryTime,
    this.btnText,
    this.adText,
    // this.imagePath,
  });

  toMap() => {
        'id': id,
        'deliveryTime': deliveryTime,
        'btnText': btnText,
        'adText': adText,
        // 'imagePath': imagePath,
      };
}
