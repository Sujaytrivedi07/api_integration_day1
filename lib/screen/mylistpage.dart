import 'package:day_1_get_api_dio/constant.dart';
import 'package:day_1_get_api_dio/provider/provider_class.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/name_list_model.dart';
import 'details_page.dart';
class MylistPage extends StatefulWidget {
  const MylistPage({Key? key}) : super(key: key);

  @override
  State<MylistPage> createState() => _MylistPageState();
}

class _MylistPageState extends State<MylistPage> {
  Namelist? namelist;
  late AppProvider appProvider;

  @override
  void initState() {
    print("hi");
    appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getNamelist();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appProvider = context.watch<AppProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(appProvider.ltg==true){
            appProvider.ltg=false;
            appProvider.buttonname="List";
            appProvider.refresh();
          }else{
            appProvider.ltg=true;
            appProvider.buttonname="Grid";
            appProvider.refresh();
          }
          print(appProvider.ltg);
        },child: Text("${appProvider.buttonname}"),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Homepage"),
      ),
      body: appProvider.isLoading == true ? Center(
          child: CircularProgressIndicator()):appProvider.ltg==false? gridview():listview(),
    );
  }

  Widget listview() {
    return ListView.builder(
      itemCount: appProvider.mylist.length, itemBuilder: (context, index) =>
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(),));
           ConstantVarible.index=index;
          },
          child: ListTile(
            leading: Icon(Icons.person,color: Colors.blue),
            title: Text(appProvider.mylist[index].name ?? ""),
            trailing: Text(appProvider.mylist[index].city ?? ""),
          ),
        ),);
  }

  Widget gridview() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount:appProvider.mylist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(),));
              ConstantVarible.index=index;
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top:50),
                child: Column(
                  children: [
                    Icon(Icons.person,color: Colors.blue),
                    Text(appProvider.mylist[index].name??""),
                    Text(appProvider.mylist[index].city??"")
                  ],
                ),
              ),
              color: Colors.lightGreenAccent,
            ),
          );
        });
  }

}
