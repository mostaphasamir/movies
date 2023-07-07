import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/tvs/presentation/controller/series_bloc.dart';
import 'package:movie/tvs/presentation/controller/series_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constant.dart';


class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch(state.topRatedState){
          case RequestState.loading:
           return Container(
             height: 170.0,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedSeries.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedSeries[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS

                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl:
                          ApiConstant.imageUrl(movie.backdropPath),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
          case RequestState.error:
            return Container(
              height: 170.0,
              alignment: Alignment.center,
              child: Text(state.topRatedMessage),
            );
        }
      },
    );
  }
}
