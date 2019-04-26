class OrbitParams {
  /// The reference system. (ex: Geocentric, Heliocentric etc.)
  final String referenceSystem;

  /// The orbit regime. (ex: Geostationary)
  final String regime;

  final double longitude;

  /// The semi major axis in kilometers.
  final double semiMajorAxis;

  final double eccentricity;

  /// The periapsis in kilometers.
  final double periapsis;

  /// The apoapsis in kilometers.
  final double apoapsis;

  /// The orbit inclination in degrees.
  final double inclination;

  /// The orbit period in minutes.
  final double period;

  /// The orbit lifespan in years.
  final double lifespan;

  final DateTime epoch;
  final double meanMotion;
  final double raan;

  OrbitParams({
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxis,
    this.eccentricity,
    this.periapsis,
    this.apoapsis,
    this.inclination,
    this.period,
    this.lifespan,
    this.epoch,
    this.meanMotion,
    this.raan,
  });

  factory OrbitParams.fromJson(Map<String, dynamic> json) {
    return OrbitParams(
      referenceSystem: json["reference_system"],
      regime: json["regime"],
      longitude: double.tryParse(json["longitude"].toString()),
      semiMajorAxis: double.tryParse(json["semi_major_axis_km"].toString()),
      eccentricity: double.tryParse(json["eccentricity"].toString()),
      periapsis: double.tryParse(json["periapsis_km"].toString()),
      apoapsis: double.tryParse(json["apoapsis_km"].toString()),
      inclination: double.tryParse(json["inclination_deg"].toString()),
      period: double.tryParse(json["period_min"].toString()),
      lifespan: double.tryParse(json["lifespan_years"].toString()),
      epoch: DateTime.tryParse(json["epoch"].toString()),
      meanMotion: double.tryParse(json["mean_motion"].toString()),
      raan: double.tryParse(json["raan"].toString()),
    );
  }
}
