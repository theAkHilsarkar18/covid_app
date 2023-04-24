

import 'package:flutter/cupertino.dart';

import '../../utils/apihelper.dart';
import '../model/covidemodel.dart';

class Homeprovider extends ChangeNotifier
{
  CovidModel? c1;
  Future<CovidModel?> getApiCalling()
  async {
     c1 =  await ApiHelper().getApi();
    return c1;
  }
}