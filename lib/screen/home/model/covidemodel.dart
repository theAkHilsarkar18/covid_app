// To parse this JSON data, do
//
//     final covidModel = covidModelFromJson(jsonString);

import 'dart:convert';

CovidModel covidModelFromJson(String str) => CovidModel.fromJson(json.decode(str));

String covidModelToJson(CovidModel data) => json.encode(data.toJson());

class CovidModel {
  CovidModel({
    this.countriesStat,
    this.statisticTakenAt,
    this.worldTotal,
  });

  List<CountriesStat>? countriesStat;
  DateTime? statisticTakenAt;
  WorldTotal? worldTotal;

  factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
    countriesStat: json["countries_stat"] == null ? [] : List<CountriesStat>.from(json["countries_stat"]!.map((x) => CountriesStat.fromJson(x))),
    statisticTakenAt: json["statistic_taken_at"] == null ? null : DateTime.parse(json["statistic_taken_at"]),
    worldTotal: json["world_total"] == null ? null : WorldTotal.fromJson(json["world_total"]),
  );

  Map<String, dynamic> toJson() => {
    "countries_stat": countriesStat == null ? [] : List<dynamic>.from(countriesStat!.map((x) => x.toJson())),
    "statistic_taken_at": statisticTakenAt?.toIso8601String(),
    "world_total": worldTotal?.toJson(),
  };
}

class CountriesStat {
  CountriesStat({
    this.countryName,
    this.cases,
    this.deaths,
    this.region,
    this.totalRecovered,
    this.newDeaths,
    this.newCases,
    this.seriousCritical,
    this.activeCases,
    this.totalCasesPer1MPopulation,
    this.deathsPer1MPopulation,
    this.totalTests,
    this.testsPer1MPopulation,
  });

  String? countryName;
  String? cases;
  String? deaths;
  String? region;
  String? totalRecovered;
  String? newDeaths;
  String? newCases;
  String? seriousCritical;
  String? activeCases;
  String? totalCasesPer1MPopulation;
  String? deathsPer1MPopulation;
  String? totalTests;
  String? testsPer1MPopulation;

  factory CountriesStat.fromJson(Map<String, dynamic> json) => CountriesStat(
    countryName: json["country_name"],
    cases: json["cases"],
    deaths: json["deaths"],
    region: json["region"],
    totalRecovered: json["total_recovered"],
    newDeaths: json["new_deaths"],
    newCases: json["new_cases"],
    seriousCritical: json["serious_critical"],
    activeCases: json["active_cases"],
    totalCasesPer1MPopulation: json["total_cases_per_1m_population"],
    deathsPer1MPopulation: json["deaths_per_1m_population"],
    totalTests: json["total_tests"],
    testsPer1MPopulation: json["tests_per_1m_population"],
  );

  Map<String, dynamic> toJson() => {
    "country_name": countryName,
    "cases": cases,
    "deaths": deaths,
    "region": region,
    "total_recovered": totalRecovered,
    "new_deaths": newDeaths,
    "new_cases": newCases,
    "serious_critical": seriousCritical,
    "active_cases": activeCases,
    "total_cases_per_1m_population": totalCasesPer1MPopulation,
    "deaths_per_1m_population": deathsPer1MPopulation,
    "total_tests": totalTests,
    "tests_per_1m_population": testsPer1MPopulation,
  };
}

class WorldTotal {
  WorldTotal({
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
    this.seriousCritical,
    this.totalCasesPer1MPopulation,
    this.deathsPer1MPopulation,
    this.statisticTakenAt,
  });

  String? totalCases;
  String? newCases;
  String? totalDeaths;
  String? newDeaths;
  String? totalRecovered;
  String? activeCases;
  String? seriousCritical;
  String? totalCasesPer1MPopulation;
  String? deathsPer1MPopulation;
  DateTime? statisticTakenAt;

  factory WorldTotal.fromJson(Map<String, dynamic> json) => WorldTotal(
    totalCases: json["total_cases"],
    newCases: json["new_cases"],
    totalDeaths: json["total_deaths"],
    newDeaths: json["new_deaths"],
    totalRecovered: json["total_recovered"],
    activeCases: json["active_cases"],
    seriousCritical: json["serious_critical"],
    totalCasesPer1MPopulation: json["total_cases_per_1m_population"],
    deathsPer1MPopulation: json["deaths_per_1m_population"],
    statisticTakenAt: json["statistic_taken_at"] == null ? null : DateTime.parse(json["statistic_taken_at"]),
  );

  Map<String, dynamic> toJson() => {
    "total_cases": totalCases,
    "new_cases": newCases,
    "total_deaths": totalDeaths,
    "new_deaths": newDeaths,
    "total_recovered": totalRecovered,
    "active_cases": activeCases,
    "serious_critical": seriousCritical,
    "total_cases_per_1m_population": totalCasesPer1MPopulation,
    "deaths_per_1m_population": deathsPer1MPopulation,
    "statistic_taken_at": statisticTakenAt?.toIso8601String(),
  };
}
