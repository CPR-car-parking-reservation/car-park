import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class LoadCars extends SettingEvent {}


class FetchCarById extends SettingEvent {
  final String carId;

  const FetchCarById({required this.carId});

  @override
  List<Object> get props => [carId];
}


class AddCar extends SettingEvent {
  final String plate;
  final String model;
  final String type;
  final File imageFile;

  const AddCar({
    required this.plate,
    required this.model,
    required this.type,
    required this.imageFile,
  });

  @override
  List<Object> get props => [plate, model, type, imageFile];
}


class UpdateCar extends SettingEvent {
  final String id;
  final String plate;
  final String model;
  final String type;

  const UpdateCar({
    required this.id,
    required this.plate,
    required this.model,
    required this.type,
  });

  @override
  List<Object> get props => [id, plate, model, type];
}


class DeleteCar extends SettingEvent {
  final String id;

  const DeleteCar({required this.id});

  @override
  List<Object> get props => [id];
}