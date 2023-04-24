import 'package:covid_app/screen/home/model/covidemodel.dart';
import 'package:covid_app/screen/home/provider/homeprovider.dart';
import 'package:covid_app/screen/utils/apihelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Homeprovider>(context,listen: false).getApiCalling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    Homeprovider homeproviderFalse = Provider.of(context,listen: false);
    Homeprovider homeproviderTrue = Provider.of(context,listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("CovidApp",style: TextStyle(letterSpacing: 1)),
        ),
        body: Center(
          child: FutureBuilder(
            future: homeproviderFalse.getApiCalling(),
            builder: (context, snapshot) {
              if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
              else if(snapshot.hasData)
              {
                CovidModel? c1 = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height:400,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // Container(height: 400,color : Colors.black12,child: ClipRRect(borderRadius: BorderRadiusDirectional.circular(20),child: Image.asset("assets/img/cbg.webp",fit: BoxFit.cover))),
                        Text("Country Name : ${c1.countriesStat![index].countryName}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20)),
                        Text("Active Cases : ${c1.countriesStat![index].activeCases}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20)),
                        Text("Total Deaths : ${c1.countriesStat![index].deaths}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20)),
                        Text("Total Recovered : ${c1.countriesStat![index].totalRecovered}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20)),
                        Text("Serious Critical : ${c1.countriesStat![index].totalRecovered}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 20)),
                      ],
                    ),
                  );
                },itemCount: c1!.countriesStat!.length,shrinkWrap: true,);
              }
              return CircularProgressIndicator(color: Colors.red,);
            },

          ),
        ),
      ),
    );
  }
}

//
