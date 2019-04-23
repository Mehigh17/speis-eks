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
        longitude: double.parse(json["longitude"]),
        semiMajorAxis: double.parse(json["semi_major_axis_km"]),
        eccentricity: double.parse(json["eccentricity"]),
        periapsis: double.parse(json["periapsis_km"]),
        apoapsis: double.parse(json["apoapsis_km"]),
        inclination: double.parse(json["inclination_deg"]),
        period: double.parse(json["period_min"]),
        lifespan: double.parse(json["lifespan_years"]),
        epoch: DateTime.parse(json["epoch"]),
        meanMotion: double.parse(json["mean_motion"]),
        raan: double.parse(json["raan"]));
  }
}
