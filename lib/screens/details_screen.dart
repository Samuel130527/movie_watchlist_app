import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Movie poster
            Image.asset(
              movie.posterPath,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Movie title
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Cast heading
                  const Text(
                    'Cast',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Cast members
                  Text(
                    movie.cast.join(', '),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Synopsis heading
                  const Text(
                    'Synopsis',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Synopsis
                  Text(
                    movie.synopsis,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}