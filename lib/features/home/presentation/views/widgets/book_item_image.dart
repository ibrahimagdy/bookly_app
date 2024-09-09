import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';

class BookItemImage extends StatelessWidget {
  final BookModel bookModel;
  final String imageUrl;

  const BookItemImage({super.key, required this.imageUrl, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(Routes.details,extra: bookModel);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error_outline, size: 38,),
          ),
        ),
      ),
    );
  }
}
