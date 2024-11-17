import 'package:flutter/material.dart';

import '../../domain/model/post_model.dart';

class M3Card extends StatelessWidget {
  const M3Card({
    super.key,
    required this.post,
    this.width = 0,
    this.height = 0,
  });

  final PostModel post;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(post.imageUrl),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                  child: Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: Text(
                    post.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
