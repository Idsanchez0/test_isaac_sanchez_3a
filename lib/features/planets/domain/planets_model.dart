import 'dart:convert';

class PlanetsModel {
  String? name;
  String? orbitalDistanceKm;
  String? equatorialRadiusKm;
  String? volumeKm3;
  String? massKg;
  String? densityGCm3;
  String? surfaceGravityMS2;
  String? escapeVelocityKmh;
  String? dayLengthEarthDays;
  String? yearLengthEarthDays;
  String? orbitalSpeedKmh;
  String? atmosphereComposition;
  String? moons;
  String? image;
  String? description;

  PlanetsModel({
    this.name,
    this.orbitalDistanceKm,
    this.equatorialRadiusKm,
    this.volumeKm3,
    this.massKg,
    this.densityGCm3,
    this.surfaceGravityMS2,
    this.escapeVelocityKmh,
    this.dayLengthEarthDays,
    this.yearLengthEarthDays,
    this.orbitalSpeedKmh,
    this.atmosphereComposition,
    this.moons,
    this.image,
    this.description,
  });

  factory PlanetsModel.fromRawJson(String str) =>
      PlanetsModel.fromJson(json.decode(str));

  factory PlanetsModel.fromJson(Map<String, dynamic> json) => PlanetsModel(
    name: json["name"],
    orbitalDistanceKm: json["orbital_distance_km"].toString(),
    equatorialRadiusKm: json["equatorial_radius_km"].toString(),
    volumeKm3: json["volume_km3"].toString(),
    massKg: json["mass_kg"].toString(),
    densityGCm3: json["density_g_cm3"].toString(),
    surfaceGravityMS2: json["surface_gravity_m_s2"].toString(),
    escapeVelocityKmh: json["escape_velocity_kmh"].toString(),
    dayLengthEarthDays: json["day_length_earth_days"].toString(),
    yearLengthEarthDays: json["year_length_earth_days"].toString(),
    orbitalSpeedKmh: json["orbital_speed_kmh"].toString(),
    atmosphereComposition: json["atmosphere_composition"],
    moons: json["moons"].toString(),
    image: json["image"],
    description: json["description"],
  );
}
