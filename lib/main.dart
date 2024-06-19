import 'dart:async';


import 'package:flutter/material.dart';
import 'package:local_database_example/LocalDatabase/Model.dart';
import 'package:local_database_example/LocalDatabase/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Local Database Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late EmployeeDatabase employeeDatabase;

data()async{
  await addEmployee(employeeDatabase);

}

@override
  void initState() {
    super.initState();
    $FloorEmployeeDatabase.databaseBuilder('employee_database.db').build().then((value) async{
      employeeDatabase = value;
      await data();
      setState(() {
      });
    });
  }

Future<List<EmployeeData>> retrieveUser() async{
  return await employeeDatabase.employeeDAO.retrieveAllData();
}

List<EmployeeData> allData = [
  EmployeeData(name:"Ankita saxena",designation: 'Software Engineer',salary: '40000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Vidhi saxena",designation: 'Software Engineer',salary: '50000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Niharika Dixit",designation: 'Software Engineer',salary: '70000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Shivam Tiwari",designation: 'Software Engineer',salary: '200000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Swati Tripathi",designation: 'Software Engineer',salary: '30000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Sandeep Verma",designation: 'Software Engineer',salary: '90000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Rahul Tiwari",designation: 'Software Engineer',salary: '10000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Shikha Upadhyay",designation: 'Software Engineer',salary: '20000',createdAt: '',updatedAt: ''),
  EmployeeData(name:"Anchal Gupta",designation: 'Software Engineer',salary: '30000',createdAt: '',updatedAt: ''),
];
   addEmployee(EmployeeDatabase db) async{
     for(int i =0; i<allData.length;i++){
       EmployeeData firstEmployee =  allData[i];
       await db.employeeDAO.insertEmployeeData(firstEmployee);
     }
    retrieveUser();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: (){

            },
            child: Text("Import Data")),
      ),
      body: FutureBuilder(
        future: retrieveUser(),
        builder: (BuildContext context, AsyncSnapshot<List<EmployeeData>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context,int index){
                return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.redAccent,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Icon(Icons.delete_forever),
                    ),
                    key: ValueKey<int>(snapshot.data![index].id!),
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(snapshot.data![index].name ?? ''),
                        subtitle: Text(snapshot.data![index].designation??''),
                      ),
                    )
                );
                }
            );
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
