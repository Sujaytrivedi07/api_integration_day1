import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/name_list_model.dart';

class AppProvider extends ChangeNotifier{
  late  List<Namelist>mylist=[];
  bool ltg=true;
  bool isLoading=true;
  String buttonname="Grid";
  Future<List<Namelist>?> getNamelist()async{
    Dio dio=Dio();

    String url="https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8";
    Response response= await dio.get(url);
    var result=response.data;

    print("!---------$response");
    print(result);

    for(Map<String,dynamic> i in result){
      mylist.add(Namelist.fromJson(i));

      print(">>>>>>>>>>>>>>>>>>>>>>${mylist.length}");
     // return mylist;
    }

    isLoading=false;
    notifyListeners();
    return mylist;
  }
  void refresh(){
    notifyListeners();
  }
}