part of 'admin_parking_bloc.dart';

@immutable
sealed class AdminParkingEvent {}

final class OnParkingPageLoad extends AdminParkingEvent {}

final class SetLoading extends AdminParkingEvent {}

class OnRefresh extends AdminParkingEvent {
  final String? search;
  final String? floor;
  final String? status;

  OnRefresh({this.search, this.floor, this.status});
}

class OnSearch extends AdminParkingEvent {
  final String? search;
  final String? floor;
  final String? status;

  OnSearch({this.search, this.floor, this.status});
}

class OnDelete extends AdminParkingEvent {
  final String id;

  OnDelete(this.id);
}

class OnUpdate extends AdminParkingEvent {
  final String id;
  final String slot_number;
  final String floor_number;
  final String statusText;

  OnUpdate(this.id, this.slot_number, this.floor_number, this.statusText);
}

class OnCreate extends AdminParkingEvent {
  final String? slot_number;
  final String? floor_number;

  OnCreate(this.slot_number, this.floor_number);
}
