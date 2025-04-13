import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class HomeRepos {
    Future<Either<Failures, UserEntity>> getuserData({required String uid});
    

}