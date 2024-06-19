import 'package:floor/floor.dart';
import 'package:local_database_example/LocalDatabase/Model.dart';

@dao
abstract class EmployeeDAO{
  @insert
  Future<int> insertEmployeeData(EmployeeData employeeData);

  @Query('SELECT * FROM employee_data WHERE id= :id')
  Future<List<EmployeeData>> retrieveOneEmployeeData(int id);
  
  @Query('SELECT * FROM employee_data')
  Future<List<EmployeeData>> retrieveAllData();
  
  @Query('DELETE FROM User WHERE id = :id')
   Future<EmployeeData?> deleteUser(int id);

}