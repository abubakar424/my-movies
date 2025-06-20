
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/data/error/exceptions.dart';
import '../../../core/data/error/failure.dart';
import '../../../core/domain/entities/media.dart';
import '../../../core/domain/entities/media_details.dart';
import '../../domain/entities/season_details.dart';
import '../../domain/repository/tv_shows_repository.dart';
import '../../domain/usecases/get_season_details_usecase.dart';
import '../datasource/tv_shows_remote_data_source.dart';

class TVShowsRepositoryImpl implements TVShowsRepository {
  final TVShowsRemoteDataSource _baseTVShowsRemoteDataSource;

  TVShowsRepositoryImpl(this._baseTVShowsRemoteDataSource);

  @override
  Future<Either<Failure, List<List<Media>>>> getTVShows() async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getTVShows();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        failure.errorMessageModel.statusMessage ?? 'Unknown TV shows error',
      ));
    } on DioError catch (failure) {
      return Left(ServerFailure(
        failure.message ?? 'Failed to load TV shows',
      ));
    }
  }

  @override
  Future<Either<Failure, MediaDetails>> getTVShowDetails(int id) async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getTVShowDetails(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        failure.errorMessageModel.statusMessage ?? 'Failed to load TV show details',
      ));
    } on DioError catch (failure) {
      return Left(ServerFailure(
        failure.message ?? 'Network error loading TV show',
      ));
    }
  }

  @override
  Future<Either<Failure, SeasonDetails>> getSeasonDetails(
      SeasonDetailsParams params) async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getSeasonDetails(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        failure.errorMessageModel.statusMessage ?? 'Failed to load season details',
      ));
    } on DioError catch (failure) {
      return Left(ServerFailure(
        failure.message ?? 'Network error loading season',
      ));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllPopularTVShows(int page) async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getAllPopularTVShows(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        failure.errorMessageModel.statusMessage ?? 'Failed to load popular TV shows',
      ));
    } on DioError catch (failure) {
      return Left(ServerFailure(
        failure.message ?? 'Network error loading popular shows',
      ));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllTopRatedTVShows(int page) async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getAllTopRatedTVShows(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        failure.errorMessageModel.statusMessage ?? 'Failed to load top rated TV shows',
      ));
    } on DioError catch (failure) {
      return Left(ServerFailure(
        failure.message ?? 'Network error loading top rated shows',
      ));
    }
  }
}