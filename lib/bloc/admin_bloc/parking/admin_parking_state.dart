part of 'admin_parking_bloc.dart';

class AdminParkingBlocState {
  final List<ParkingSlotModel> data;
  final bool is_loading;

  AdminParkingBlocState({
    required this.data,
    required this.is_loading,
  });

  @override
  List<Object> get props => [data, is_loading];
}

// final class AdminParkingBlocInitial extends AdminParkingBlocState {
//   // ignore: non_constant_identifier_names
//   AdminParkingBlocInitial(
//       {required super.id,
//       required super.slot_number,
//       required super.status,
//       required super.is_loading});
// }
