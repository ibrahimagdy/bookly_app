import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItemImage extends StatelessWidget {
  final String imageUrl;

  const BookItemImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error_outline, size: 38,),
        ),
      ),
    );
  }
}
