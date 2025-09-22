import 'package:chef_mate/utils/result.dart';
abstract class UseCase<I,O>{
  Future<Result<O>> call({ required I arg});
}