part of 'admin_parking_bloc.dart';

@immutable
sealed class AdminParkingBlocEvent {}

class ShowParkingData extends AdminParkingBlocEvent {}

class CreateParkingData extends AdminParkingBlocEvent {}

class UpdateParkingData extends AdminParkingBlocEvent {}

class DeleteParkingData extends AdminParkingBlocEvent {}
