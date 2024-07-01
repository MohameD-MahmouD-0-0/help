import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/News/models/article_model.dart';
import 'package:flutter_application_1/News/widgets/article_web_view.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebView(
              articleModel: articleModel,
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: articleModel.image != null
                ? CachedNetworkImage(
                    imageUrl: articleModel.image!,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.network(
                    'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            articleModel.subTitle ?? '',
            maxLines: 2,
            style: const TextStyle(
                color: Color.fromARGB(255, 127, 125, 125), fontSize: 12),
          )
        ],
      ),
    );
  }
}
