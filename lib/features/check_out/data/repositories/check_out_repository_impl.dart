import '../../domain/repositories/check_out_repository.dart';
import '../datasources/check_out_remote_datasource.dart';

class Check_outRepositoryImpl implements Check_outRepository {
  final Check_outRemoteDataSource remoteDataSource;

  Check_outRepositoryImpl(this.remoteDataSource);

  // TODO: Implement repository logic
}
