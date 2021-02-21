import 'package:duration/duration.dart';
import 'package:find_anime/model/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultCard extends StatelessWidget {
  final Docs result;

  const ResultCard({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.0, 12, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  result.titleEnglish == null ? 'Unknown' : result.titleEnglish,
                  style: TextStyle(fontSize: 22),
                ),
                SelectableText(
                  result.titleRomaji == null ? 'Unknown' : result.titleRomaji,
                  style: TextStyle(fontSize: 18),
                ),
                result.isAdult
                    ? Text(
                        'Adult only!',
                        style: TextStyle(color: Colors.redAccent),
                      )
                    : Container(
                        width: 0,
                        height: 0,
                      ),
                SelectableText(
                    result.titleNative == null ? 'Unknown' : result.titleNative,
                    style: TextStyle(fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: SelectableText(
                    'Episode ${result.episode} in season ${result.season}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SelectableText(
                  'This image at ${(printDuration(Duration(milliseconds: (result.at * 1000).toInt())))}',
                  style: TextStyle(fontSize: 16),
                ),
                SelectableText(
                  'Similarity - ${(result.similarity * 100).toStringAsFixed(1)}%',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              kIsWeb
                  ? Container(
                      width: 0,
                      height: 0,
                    )
                  : IconButton(
                      tooltip: 'Share',
                      onPressed: () {
                        Share.share("Anime - ${result.titleEnglish}\n"
                            "Episode ${result.episode} in season ${result.season}\n"
                            "This image at ${(printDuration(Duration(milliseconds: (result.at * 1000).toInt())))}");
                      },
                      icon: Icon(
                        Icons.share_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
              IconButton(
                tooltip: 'Open in browser',
                onPressed: () async {
                  String openUrl =
                      'https://anilist.co/anime/${result.anilistId}/';
                  await launch(openUrl);
                },
                icon: Icon(
                  Icons.launch_outlined,
                  color: Theme.of(context).accentColor,
                ),
              ),
              IconButton(
                tooltip: 'Copy to clipboard',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: result.titleEnglish))
                      .then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Text copied to clipboard")));
                  });
                },
                icon: Icon(
                  Icons.content_copy_outlined,
                  color: Theme.of(context).accentColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
