import 'dart:async';
import 'package:floor/floor.dart';
import 'DAO.dart';
import 'Model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart'; // the generated code will be there


@Database(version: 1, entities: [EmployeeData])
abstract class EmployeeDatabase extends FloorDatabase{
  EmployeeDAO get employeeDAO;
}