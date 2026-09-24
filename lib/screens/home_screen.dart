import 'package:flutter/material.dart';
import '../data/movies_data.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Watchlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
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
                  fontSize: 17,
                ),
              ),

              subtitle: Text(
                movie.cast.join(', '),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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