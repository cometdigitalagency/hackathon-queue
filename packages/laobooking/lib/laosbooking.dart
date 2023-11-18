library laobooking;

class Booking {
  int id;
  String name;
  String? image;
  Booking(this.id, this.name, this.image);
}

/// A Calculator.
getBookingList() {
  List<Booking> list = [
    Booking(1, "ລົງທະບຽນຈອງຄິວຂໍໜັງສືຜ່ານແດນ",
        "https://www.passportindex.org/countries/la.png"),
  ];
  return list;
}
