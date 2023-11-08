import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/presentation/components/error_screen.dart';
import 'package:movies_app/core/presentation/components/loading_indicator.dart';
import 'package:movies_app/core/presentation/components/section_listview.dart';
import 'package:movies_app/core/presentation/components/section_listview_card.dart';
import 'package:movies_app/core/resources/app_values.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc/movies_state.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const LoadingIndicator();
            case RequestStatus.loaded:
              return MoviesWidget(
                movies: state.movies[0],
              );
            case RequestStatus.error:
              return ErrorScreen(
                onTryAgainPressed: () {
                  context.read<MoviesBloc>().add(GetMoviesEvent());
                },
              );
          }
        },
      ),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> movies;

  const MoviesWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SectionListView(
      height: AppSize.s240,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return SectionListViewCard(media: movies[index]);
      },
    );
  }
}
