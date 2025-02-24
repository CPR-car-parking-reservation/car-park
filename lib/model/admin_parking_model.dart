// คลาส FloorModel สำหรับข้อมูล Floor
class FloorModel {
  String id;
  String floorNumber;
  String createdAt;
  String updatedAt;

  FloorModel({
    required this.id,
    required this.floorNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
      id: json["id"],
      floorNumber: json["floor_number"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "floor_number": floorNumber,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

// คลาส ParkingSlotModel สำหรับข้อมูล Parking Slot
class ParkingSlotModel {
  String id;
  String slotNumber;
  String status;
  String floorId;
  String createdAt;
  String updatedAt;
  FloorModel floor; // ใช้ FloorModel แทน String

  ParkingSlotModel({
    required this.id,
    required this.slotNumber,
    required this.status,
    required this.floorId,
    required this.createdAt,
    required this.updatedAt,
    required this.floor,
  });

  factory ParkingSlotModel.fromJson(Map<String, dynamic> json) {
    return ParkingSlotModel(
      id: json["id"],
      slotNumber: json["slot_number"],
      status: json["status"],
      floorId: json["floor_id"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      floor: FloorModel.fromJson(json["floor"]), // แปลงข้อมูลเป็น FloorModel
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "slot_number": slotNumber,
      "status": status,
      "floor_id": floorId,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "floor": floor.toJson(), // แปลง FloorModel กลับเป็น JSON
    };
  }
}

// คลาส ParkingSlotListModel สำหรับเก็บข้อมูลทั้งหมด
class ParkingSlotListModel {
  List<ParkingSlotModel> data;

  ParkingSlotListModel({required this.data});

  factory ParkingSlotListModel.fromJson(Map<String, dynamic> json) {
    return ParkingSlotListModel(
      data: List<ParkingSlotModel>.from(
        json["data"].map((slot) => ParkingSlotModel.fromJson(slot)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": List<dynamic>.from(data.map((slot) => slot.toJson())),
    };
  }
}
