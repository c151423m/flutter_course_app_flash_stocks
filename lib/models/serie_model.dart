class Serie {
  Map<String, dynamic> serie;
  String date = '';
  String open = '';
  String high = '';
  String low = '';
  String close = '';
  String volume = '';

  Serie({required this.serie}) {
    serie.forEach((key, value) {
      date = key;
      open = value["1. open"];
      high = value["2. high"];
      low = value["3. low"];
      close = value["4. close"];
      volume = value["5. volume"];
    });
  }
}
