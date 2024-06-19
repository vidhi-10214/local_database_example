import 'package:floor/floor.dart';

@Entity(tableName: "employee_data")
class EmployeeData{
  @PrimaryKey(autoGenerate:true)
  final int? id;
  @ColumnInfo(name:'name')
  final String? name;
  @ColumnInfo(name:'designation')
  final String? designation;
  @ColumnInfo(name:'Salary')
  final String? salary;
  @ColumnInfo(name:'Created_at')
  final String? createdAt;
  @ColumnInfo(name:'Updated_at')
  final String? updatedAt;

  EmployeeData({
  this.id,
  this.name,
  this.designation,
  this.salary,
  this.createdAt,
  this.updatedAt,
  });

  @override
  String toString() {
    return '{id: $id, name: $name, designation: $designation, salary: $salary, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

}