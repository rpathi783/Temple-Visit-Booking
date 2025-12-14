import 'package:flutter/foundation.dart';
import '../models/booking_model.dart';
import 'dart:math';

class BookingProvider with ChangeNotifier {
  BookingModel _booking = BookingModel();

  BookingModel get booking => _booking;

  void updateDate(DateTime date) {
    _booking = _booking.copyWith(date: date);
    notifyListeners();
  }

  void updateTimeSlot(String timeSlot) {
    _booking = _booking.copyWith(timeSlot: timeSlot);
    notifyListeners();
  }

  void updateVisitorCount(int count) {
    _booking = _booking.copyWith(visitorCount: count);
    List<VisitorModel> visitors = [];
    for (int i = 0; i < count; i++) {
      visitors.add(VisitorModel());
    }
    _booking = _booking.copyWith(visitors: visitors);
    notifyListeners();
  }

  void updateVisitor(int index, VisitorModel visitor) {
    List<VisitorModel> updatedVisitors = List.from(_booking.visitors);
    updatedVisitors[index] = visitor;
    _booking = _booking.copyWith(visitors: updatedVisitors);
    notifyListeners();
  }

  String generateBookingId() {
    final random = Random();
    final id = 'TEMP${random.nextInt(10000).toString().padLeft(4, '0')}';
    _booking = _booking.copyWith(bookingId: id);
    notifyListeners();
    return id;
  }

  void resetBooking() {
    _booking = BookingModel();
    notifyListeners();
  }

  bool validateBookingDetails() {
    return _booking.date != null &&
        _booking.timeSlot != null &&
        _booking.visitorCount > 0;
  }

  bool validateAllVisitors() {
    if (_booking.visitors.isEmpty) return false;
    return _booking.visitors.every((visitor) => visitor.isValid());
  }
}
