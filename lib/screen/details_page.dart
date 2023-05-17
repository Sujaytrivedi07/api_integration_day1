import 'package:day_1_get_api_dio/constant.dart';
import 'package:day_1_get_api_dio/provider/provider_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late AppProvider appProvider;
  TextEditingController namecontroller=TextEditingController();
  TextEditingController citycontroller=TextEditingController();
  @override
  void initState() {
    appProvider = Provider.of<AppProvider>(context, listen: false);
    namecontroller.text=appProvider.mylist[ConstantVarible.index].name??"";
    citycontroller.text=appProvider.mylist[ConstantVarible.index].city??"";

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150,left: 10,right: 10),
            child: Column(
              children: [
                Text("Details",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: citycontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      )
                  ),
                )
            ,
            SizedBox(
            height: 10,
          ),

                ElevatedButton(onPressed: (){
                 Navigator.pop(context);
                }, child: Text("Edit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
