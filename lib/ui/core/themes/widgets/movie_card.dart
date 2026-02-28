import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCard extends ConsumerStatefulWidget {
  const MovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
    required this.isFavorite,
    this.onFavoriteToggle,
  });

  final int id;
  final String title;
  final int releaseDate;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 148,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl.isNotEmpty
                    ? widget.imageUrl
                    : 'https://via.placeholder.com/148x184?text=No+Image',
                imageBuilder: (context, imageProvider) => Container(
                  width: 148,
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 148,
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.releaseDate.toString(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 50,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: widget.onFavoriteToggle,
                icon: Icon(
                  widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
