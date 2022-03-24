/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 3/23/2022 at 10:30 AM.   ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/

List<CoachModel>listCoachesFromJson(List<dynamic> json) => List.from(json.map((coach) => CoachModel.fromJson(coach)));

class CoachModel {
  CoachModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.profilePhoto,
    this.coverPhoto,
    this.bio,
    this.sport,
    this.createdAt,
    this.updatedAt,
  });

  CoachModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name']??'';
    email = json['email']??'';
    address = json['address']??'';
    profilePhoto = json['profilePhoto']??'';
    coverPhoto = json['coverPhoto']??'';
    bio = json['bio']??'';
    sport = json['sport']??'';
    createdAt = json['createdAt']??'';
    updatedAt = json['updatedAt']??'';
  }

  int? id;
  String? name;
  String? email;
  String? address;
  String? profilePhoto;
  String? coverPhoto;
  String? bio;
  String? sport;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['profilePhoto'] = profilePhoto;
    map['coverPhoto'] = coverPhoto;
    map['bio'] = bio;
    map['sport'] = sport;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
