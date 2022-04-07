class EnterpriseTypeModel {
  int id;
  String? name;

  EnterpriseTypeModel({
    required this.id,
    this.name,
  });

  factory EnterpriseTypeModel.fromJson(Map<String, dynamic> json) {
    return EnterpriseTypeModel(
      id: json['id'],
      name: json['enterprise_type_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['enterprise_type_name'] = name;
    return data;
  }
}
