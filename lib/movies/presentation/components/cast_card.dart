
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/presentation/components/image_with_shimmer.dart';
import '../../../core/resources/app_values.dart';
import '../../domain/entities/cast.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({
    required this.cast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: AppSize.s100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s8),
            child: ImageWithShimmer(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: AppSize.s130,
            ),
          ),
          Text(
            cast.name,
            style: textTheme.bodyLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
