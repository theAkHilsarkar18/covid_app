
import 'dart:convert';

import 'package:covid_app/screen/home/model/covidemodel.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  Future<CovidModel> getApi()
  async {
    String link  = 'https://corona-virus-world-and-india-data.p.rapidapi.com/api';
    Uri uri = Uri.parse(link);
    var response = await  http.get(uri,headers: {
      "content-type":"application/octet-stream",
      "X-RapidAPI-Key":"10fae5a147msh1e76b2f84d872e6p1c20a8jsne51a7b9bfa20",
      "X-RapidAPI-Host":"corona-virus-world-and-india-data.p.rapidapi.com",
    });

    var json = jsonDecode(response.body);
    print(json);
    CovidModel c1 = CovidModel.fromJson(json);
    covidModel = CovidModel.fromJson(json);
    print("${c1.countriesStat!.length}====================");
    return c1;
  }
}



CovidModel? covidModel;