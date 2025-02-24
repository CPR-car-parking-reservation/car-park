// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:car_parking_reservation/model/admin_parking_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

part 'admin_parking_event.dart';
part 'admin_parking_state.dart';

class AdminParkingBloc
    extends Bloc<AdminParkingBlocEvent, AdminParkingBlocState> {
  AdminParkingBloc()
      : super(AdminParkingBlocState(
          is_loading: false,
          data: [],
        )) {
    on<ShowParkingData>(_handleShowParkingData);
    // on<CreateParkingData>(_handleCreateParkingData);
    // on<UpdateParkingData>(_handleUpdateParkingData);
    // on<DeleteParkingData>(_handleDeleteParkingData);
  }
  String base_url = dotenv.env['API_URL']!;

  Future<List<ParkingSlotModel>> fetch_parking_slots() async {
    final response = await http.get(
        Uri.parse('http://localhost:4000/parking_slots')); // ดึงข้อมูลจาก API

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = json.decode(response.body);
      log('responseJson: $responseJson');
      final List<dynamic> ParkingList =
          responseJson['data']; // เข้าถึงคีย์ 'cars'
      return ParkingList.map((Parking) => ParkingSlotModel.fromJson(Parking))
          .toList(); // แปลงข้อมูล
    } else {
      throw Exception('error fetching data');
    }
  }

  Future<void> _handleShowParkingData(
      ShowParkingData event, Emitter<AdminParkingBlocState> emit) async {
    emit(AdminParkingBlocState(is_loading: true, data: []));
    try {
      final List<ParkingSlotModel> parking_slots = await fetch_parking_slots();
      log("fetching data");
      emit(AdminParkingBlocState(is_loading: false, data: parking_slots));
    } catch (e) {
      log('error: $e');
      emit(AdminParkingBlocState(is_loading: false, data: []));
    }
  }

  // Future<void> _handleCreateParkingData(
  //     CreateParkingData event, Emitter<AdminParkingBlocState> emit) async {
  //   emit(AdminParkingBlocState(
  //       is_loading: true, id: "", slot_number: "", status: ""));
  // }

  // Future<void> _handleUpdateParkingData(
  //     UpdateParkingData event, Emitter<AdminParkingBlocState> emit) async {
  //   emit(AdminParkingBlocState(
  //       is_loading: true, id: "", slot_number: "", status: ""));
  // }

  // Future<void> _handleDeleteParkingData(
  //     DeleteParkingData event, Emitter<AdminParkingBlocState> emit) async {
  //   emit(AdminParkingBlocState(
  //       is_loading: true, id: "", slot_number: "", status: ""));
  // }
}
