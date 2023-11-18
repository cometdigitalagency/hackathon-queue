library laosbooking;

class Booking {
  int id;
  String name;
  String? image;
  Booking(this.id, this.name, this.image);
}

/// A Calculator.
getReservationList() {
  List<Booking> list = [
    Booking(1, "passport", "https://www.passportindex.org/countries/la.png"),
  ];
  return list;
}
