import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Map movie;
  final VoidCallback onTap;

  const MovieCard({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // Movie thumbnail
            movie['image'] != null
                ? Image.network(
                    movie['image']['medium'],
                    height: 120,
                    width: 80,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 120,
                    width: 80,
                    color: Colors.grey,
                    child:
                        const Icon(Icons.image, size: 40, color: Colors.white),
                  ),
            const SizedBox(width: 16),
            // Movie title and summary
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie['name'] ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie['summary'] != null
                          ? movie['summary'].replaceAll(
                              RegExp(r'<[^>]*>'), '') // Strip HTML tags
                          : 'No summary available',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
