import 'package:flutter/material.dart';
import '../data/movies_data.dart';
import 'details_screen.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watchlistedMovies =
        sampleMovies.where((movie) => movie.isWatchlisted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      body: watchlistedMovies.isEmpty
          ? const Center(
              child: Text(
                'No movies in your watchlist.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: watchlistedMovies.length,
              itemBuilder: (context, index) {
                final movie = watchlistedMovies[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        movie.posterPath,
                        width: 60,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      movie.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(movie: movie),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}