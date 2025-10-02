import 'package:chaf_mate_2/utils/result.dart';

abstract class UseCase<I,O> {
  Future<Result<O>> call({ required I arg });
}