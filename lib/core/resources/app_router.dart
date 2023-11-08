import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/about_us/views/about_us_view.dart';
import 'package:movies_app/core/presentation/pages/main_page.dart';
import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view.dart';
import 'package:movies_app/movies/presentation/views/movies_view.dart';
import 'package:movies_app/settings/presentation/views/settings_view.dart';
import 'package:movies_app/watchlist/presentation/views/watchlist_view.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String favoritesPath = '/favorites';
const String settingsPath = '/settings';
const String aboutUsPath = '/aboutUs';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MoviesView(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.movieDetailsRoute,
                path: movieDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: MovieDetailsView(
                    movieId: int.parse(state.params['movieId']!),
                  ),
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.favoriteRoute,
            path: favoritesPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WatchlistView(),
            ),
          ),
          GoRoute(
            name: AppRoutes.aboutUsRoute,
            path: aboutUsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AboutUsViews(),
            ),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutes.settingsRoute,
        path: settingsPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SettingsView(),
        ),
      ),
    ],
  );
}
