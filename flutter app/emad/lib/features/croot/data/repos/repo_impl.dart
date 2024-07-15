import 'package:emad/features/croot/data/datasource/datasource.dart';
import 'package:emad/features/croot/domain/repositories/repo.dart';

class RepositoryImpl extends Repository{
  RepositoryImpl(DataSource dataSource):_dataSource=dataSource;
  final DataSource _dataSource;

  @override
  Future<List<Map<String,Object?>>> all(String tName) async{
    final a = await _dataSource.all(tName);
    // TODO: implement all
    throw UnimplementedError();
  }

}