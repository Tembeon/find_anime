import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/search_result_model.dart';

class ResultListItem extends StatelessWidget {
  const ResultListItem({Key? key, required this.result}) : super(key: key);
  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          AnimatedSize(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 400),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.network(
                result.image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SelectableText(
            result.anilist!.title!.english ?? 'Unknown english name',
            style: Theme.of(context).textTheme.headline6,
          ),
          SelectableText(
            result.anilist!.title!.romaji ?? 'Unknown romaji name',
            style: Theme.of(context).textTheme.headline6,
          ),
          SelectableText(
            result.anilist!.title!.native ?? 'Unknown native name',
            style: Theme.of(context).textTheme.headline6,
          ),
          SelectableText(
            'Similarity - ${(result.similarity! * 100).toStringAsFixed(1)}%',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'Open in browser',
                icon: const Icon(Icons.open_in_new_outlined),
                onPressed: () => launchUrl(Uri.parse(
                  'https://anilist.co/anime/${result.anilist!.id}',
                )),
              ),
              IconButton(
                tooltip: 'More info',
                icon: const Icon(Icons.info_outlined),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: SelectableText(result.anilist!.title!.romaji!),
                      content: SelectableText(
                        'Synonyms: ${result.anilist!.synonyms}\n'
                        'NSFW: ${result.anilist!.isAdult}\n'
                        'This moment at: ${prettyDuration(Duration(seconds: result.from!.toInt()), abbreviated: true)}\n'
                        'Episode: ${result.episode}\n',
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
