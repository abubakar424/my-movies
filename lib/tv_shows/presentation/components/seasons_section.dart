import 'package:flutter/material.dart';
import 'package:my_movies/tv_shows/presentation/components/season_card.dart';

import '../../../core/resources/app_values.dart';
import '../../domain/entities/season.dart';

class SeasonsSection extends StatelessWidget {
  const SeasonsSection({
    super.key,
    required this.seasons,
    required this.tmdbID,
  });

  final List<Season> seasons;
  final int tmdbID;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: AppSize.s400),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        physics: const BouncingScrollPhysics(),
        itemCount: seasons.length,
        itemBuilder: (context, index) => SeasonCard(
          season: seasons[index],
          tvShowId: tmdbID,
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSize.s10),
      ),
    );
  }
}
