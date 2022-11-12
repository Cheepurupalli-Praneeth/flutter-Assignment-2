import 'dart:convert';
import 'package:flutter/material.dart';
import'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key ? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}
class _ApiPageState extends State<ApiPage>
{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child: Column(
          children: [
            TextButton(onPressed: (){
              apicall();
            },
                child: Text("Call API")),
            FutureBuilder(future:apicall(),
                builder: (BuildContext context ,AsyncSnapshot snapshot){
                  if (snapshot.hasData) {
                    return Text(snapshot.data);
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }
            ),


          ],
        ),
      ),
    );
  }
}
Future <String> apicall()async{
  final url=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Bengaluru&appid=7b6a64d247382532702af14006651fcc");
  final response= await http.get(url);
  print(jsonDecode(response.body)["weather"][0]["description"]);
  String output=jsonDecode(response.body)["weather"][0]["description"];
  return output;
}