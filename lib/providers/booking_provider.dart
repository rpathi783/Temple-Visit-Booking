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
    if (count < 1) count = 1;

    // Create a fresh list of visitors
    List<VisitorModel> visitors = [];
    for (int i = 0; i < count; i++) {
      // Preserve existing visitor data if available
      if (i < _booking.visitors.length) {
        visitors.add(_booking.visitors[i]);
      } else {
        // Create new empty visitor
        visitors.add(VisitorModel());
      }
    }

    _booking = _booking.copyWith(visitorCount: count, visitors: visitors);
    debugPrint(
      'Updated visitor count: $count, visitors list length: ${_booking.visitors.length}',
    );
    notifyListeners();
  }

  void updateVisitor(int index, VisitorModel visitor) {
    if (index >= _booking.visitors.length) {
      debugPrint(
        'Error: Index $index out of bounds. Visitors length: ${_booking.visitors.length}',
      );
      return;
    }

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
    if (_booking.visitors.length != _booking.visitorCount) return false;
    return _booking.visitors.every((visitor) => visitor.isValid());
  }
}
