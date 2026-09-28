import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie poster
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    movie.posterPath,
                    height: 380,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Movie information
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  // Cast section
                  Text(
                    'Cast',
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: movie.cast.map((actor) {
                      return Chip(
                        avatar: const Icon(Icons.person_outline, size: 18),
                        label: Text(actor),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 28),

                  // Synopsis section
                  Text(
                    'Synopsis',
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    movie.synopsis,
                    style: Theme.of(context).textTheme.bodyLarge
                        ?.copyWith(height: 1.6),
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
