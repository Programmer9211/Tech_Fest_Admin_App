class CoordinatorModel {
  late String uid;
  late String name;
  late String email;

  CoordinatorModel(
      {required this.uid, required this.name, required this.email});

  CoordinatorModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
