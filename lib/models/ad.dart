class Ad {
  int id;
  String deliveryTime;
  String btnText;
  String adText;

  Ad({
    this.id,
    this.deliveryTime,
    this.btnText,
    this.adText,
  });

  toMap() => {
        'id': id,
        'deliveryTime': deliveryTime,
        'btnText': btnText,
        'adText': adText,
      };
}
