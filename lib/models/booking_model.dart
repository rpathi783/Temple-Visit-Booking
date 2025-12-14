class BookingModel {
  String temple;
  DateTime? date;
  String? timeSlot;
  int visitorCount;
  List<VisitorModel> visitors;
  String? bookingId;

  BookingModel({
    this.temple = 'Sample Temple',
    this.date,
    this.timeSlot,
    this.visitorCount = 1,
    this.visitors = const [],
    this.bookingId,
  });

  BookingModel copyWith({
    String? temple,
    DateTime? date,
    String? timeSlot,
    int? visitorCount,
    List<VisitorModel>? visitors,
    String? bookingId,
  }) {
    return BookingModel(
      temple: temple ?? this.temple,
      date: date ?? this.date,
      timeSlot: timeSlot ?? this.timeSlot,
      visitorCount: visitorCount ?? this.visitorCount,
      visitors: visitors ?? this.visitors,
      bookingId: bookingId ?? this.bookingId,
    );
  }
}

class VisitorModel {
  String name;
  String age;
  String gender;
  String idType;
  String idNumber;
  String mobile;

  VisitorModel({
    this.name = '',
    this.age = '',
    this.gender = '',
    this.idType = '',
    this.idNumber = '',
    this.mobile = '',
  });

  bool isValid() {
    return name.isNotEmpty &&
        age.isNotEmpty &&
        gender.isNotEmpty &&
        idType.isNotEmpty &&
        idNumber.isNotEmpty &&
        mobile.isNotEmpty;
  }

  VisitorModel copyWith({
    String? name,
    String? age,
    String? gender,
    String? idType,
    String? idNumber,
    String? mobile,
  }) {
    return VisitorModel(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      idType: idType ?? this.idType,
      idNumber: idNumber ?? this.idNumber,
      mobile: mobile ?? this.mobile,
    );
  }
}
