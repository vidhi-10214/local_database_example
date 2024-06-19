// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorEmployeeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$EmployeeDatabaseBuilder databaseBuilder(String name) =>
      _$EmployeeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$EmployeeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$EmployeeDatabaseBuilder(null);
}

class _$EmployeeDatabaseBuilder {
  _$EmployeeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$EmployeeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$EmployeeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<EmployeeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$EmployeeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$EmployeeDatabase extends EmployeeDatabase {
  _$EmployeeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EmployeeDAO? _employeeDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `employee_data` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT, `designation` TEXT, `Salary` TEXT, `Created_at` TEXT, `Updated_at` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EmployeeDAO get employeeDAO {
    return _employeeDAOInstance ??= _$EmployeeDAO(database, changeListener);
  }
}

class _$EmployeeDAO extends EmployeeDAO {
  _$EmployeeDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _employeeDataInsertionAdapter = InsertionAdapter(
            database,
            'employee_data',
            (EmployeeData item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'designation': item.designation,
                  'Salary': item.salary,
                  'Created_at': item.createdAt,
                  'Updated_at': item.updatedAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EmployeeData> _employeeDataInsertionAdapter;

  @override
  Future<List<EmployeeData>> retrieveOneEmployeeData(int id) async {
    return _queryAdapter.queryList('SELECT * FROM employee_data WHERE id= ?1',
        mapper: (Map<String, Object?> row) => EmployeeData(
            id: row['id'] as int?,
            name: row['name'] as String?,
            designation: row['designation'] as String?,
            salary: row['Salary'] as String?,
            createdAt: row['Created_at'] as String?,
            updatedAt: row['Updated_at'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<EmployeeData>> retrieveAllData() async {
    return _queryAdapter.queryList('SELECT * FROM employee_data',
        mapper: (Map<String, Object?> row) => EmployeeData(
            id: row['id'] as int?,
            name: row['name'] as String?,
            designation: row['designation'] as String?,
            salary: row['Salary'] as String?,
            createdAt: row['Created_at'] as String?,
            updatedAt: row['Updated_at'] as String?));
  }

  @override
  Future<EmployeeData?> deleteUser(int id) async {
    return _queryAdapter.query('DELETE FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => EmployeeData(
            id: row['id'] as int?,
            name: row['name'] as String?,
            designation: row['designation'] as String?,
            salary: row['Salary'] as String?,
            createdAt: row['Created_at'] as String?,
            updatedAt: row['Updated_at'] as String?),
        arguments: [id]);
  }

  @override
  Future<int> insertEmployeeData(EmployeeData employeeData) {
    return _employeeDataInsertionAdapter.insertAndReturnId(
        employeeData, OnConflictStrategy.abort);
  }
}
