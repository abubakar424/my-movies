
import 'package:dartz/dartz.dart';

import '../../../core/data/error/failure.dart';
import '../../../core/domain/entities/media_details.dart';
import '../../../core/domain/usecase/base_use_case.dart';
import '../repository/tv_shows_repository.dart';

class GetTVShowDetailsUseCase extends BaseUseCase<MediaDetails, int> {
  final TVShowsRepository _baseTVShowsRepository;

  GetTVShowDetailsUseCase(this._baseTVShowsRepository);
  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseTVShowsRepository.getTVShowDetails(p);
  }
}
