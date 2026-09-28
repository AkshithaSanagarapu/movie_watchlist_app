import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void _toggleWatchlist() {
    setState(() {
      widget.movie.isWatchlisted = !widget.movie.isWatchlisted;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.movie.isWatchlisted
              ? '${widget.movie.title} added to your watchlist'
              : '${widget.movie.title} removed from your watchlist',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _toggleWatchlist,
                      icon: Icon(
                        movie.isWatchlisted
                            ? Icons.bookmark_remove
                            : Icons.bookmark_add,
                      ),
                      label: Text(
                        movie.isWatchlisted
                            ? 'Remove from Watchlist'
                            : 'Add to Watchlist',
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

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
