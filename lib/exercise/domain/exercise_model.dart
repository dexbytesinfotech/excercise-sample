class ExerciseModel {
  List<Equipments>? equipments;

  ExerciseModel({this.equipments});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    if (json['equipments'] != null) {
      equipments = <Equipments>[];
      json['equipments'].forEach((v) {
        equipments!.add(Equipments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (equipments != null) {
      data['equipments'] = equipments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Equipments {
  int? id;
  String? name;

  Equipments({this.id, this.name});

  Equipments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
