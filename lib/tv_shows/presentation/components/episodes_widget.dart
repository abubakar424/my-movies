
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_strings.dart';
import '../../../core/resources/app_values.dart';
import '../../domain/entities/episode.dart';
import 'episode_card.dart';

class EpisodesWidget extends StatelessWidget {
  const EpisodesWidget({
    super.key,
    required this.episodes,
  });

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: AppSize.s400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppPadding.p8,
              top: AppPadding.p6,
            ),
            child: Text(
              AppStrings.episodes,
              style: textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: AppPadding.p8),
              physics: const BouncingScrollPhysics(),
              itemCount: episodes.length,
              itemBuilder: (context, index) =>
                  EpisodeCard(episode: episodes[index]),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSize.s10),
            ),
          ),
        ],
      ),
    );
  }
}
