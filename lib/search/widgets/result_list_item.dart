import 'package:breakpoint/breakpoint.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../generated/l10n.dart';
import '../models/search_result_model.dart';

class ResultListItem extends StatelessWidget {
  const ResultListItem({
    Key? key,
    required this.result,
    required this.device,
  }) : super(key: key);
  final ResultModel result;
  final LayoutClass device;

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = device == LayoutClass.desktop ? 12.0 : 8.0;
    final double horizontalPadding = device == LayoutClass.desktop ? 24.0 : 8.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 20.0,
              ),
              child: ResultTitleBlock(titles: result.anilist?.title),
            ),
            ResultMediaViewer(
              mediaUrl: result.video!,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ResultInfoText(
                similarity: result.similarity!,
                adultOnly: result.anilist?.isAdult ?? false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ResultEpisodeInfo(
                result: result,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ResultButtonBar(anilist: result.anilist!),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultButtonBar extends StatelessWidget {
  const ResultButtonBar({
    Key? key,
    required this.anilist,
  }) : super(key: key);

  final AnilistModel anilist;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        SizedBox(
          height: 42.0,
          child: OutlinedButton(
            onPressed: () => launchUrl(Uri.parse(
              'https://anilist.co/anime/${anilist.id}',
            )),
            child: Text(S.of(context).viewInAnilist),
          ),
        ),
        SizedBox(
          height: 42.0,
          child: ElevatedButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: anilist.title!.romaji),
              );

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(S.of(context).copiedText),
                behavior: SnackBarBehavior.floating,
              ));
            },
            child: Text(S.of(context).copyNameButton),
          ),
        ),
      ],
    );
  }
}

class ResultTitleBlock extends StatelessWidget {
  const ResultTitleBlock({
    Key? key,
    required this.titles,
  }) : super(key: key);

  final TitleModel? titles;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TextAvatar(
        shape: Shape.Circular,
        text: titles?.romaji ?? S.of(context).noRomajiName,
      ),
      title: SelectableText(
        titles?.romaji ?? S.of(context).noRomajiName,
        style: TextStyle(
          fontSize: 24.0,
          fontFamily: 'Roboto',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      subtitle: SelectableText(
        titles?.native ?? S.of(context).noJapaneseName,
        style: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Roboto',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}

class ResultMediaViewer extends StatefulWidget {
  const ResultMediaViewer({
    Key? key,
    required this.mediaUrl,
  }) : super(key: key);

  final String mediaUrl;

  @override
  State<ResultMediaViewer> createState() => _ResultMediaViewerState();
}

class _ResultMediaViewerState extends State<ResultMediaViewer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.mediaUrl,
    )..initialize().then((value) {
        _controller.setVolume(0.0).then((_) => _controller.play());
        setState;
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: double.infinity,
          height: constraints.maxWidth / 1.78, // 1.78 cuz aspect ratio is 16:9
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              MouseRegion(
                onExit: (event) async {
                  await _controller.setLooping(false);
                  await _controller.setVolume(0.0);
                },
                onHover: (event) async {
                  await _controller.setLooping(true);
                  await _controller.setVolume(0.1);
                  await _controller.play();
                },
                child: VideoPlayer(
                  _controller,
                ),
              ),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ResultInfoText extends StatelessWidget {
  const ResultInfoText({
    Key? key,
    required this.similarity,
    required this.adultOnly,
  }) : super(key: key);

  final num similarity;
  final bool adultOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).similarityText((similarity * 100).toStringAsFixed(1)),
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Roboto',
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        if (adultOnly)
          Text(
            S.of(context).adultOnly,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Roboto',
              color: Theme.of(context).colorScheme.error,
            ),
          ),
      ],
    );
  }
}

class ResultEpisodeInfo extends StatelessWidget {
  const ResultEpisodeInfo({Key? key, required this.result}) : super(key: key);
  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).episodeText(
                result.episode?.toInt() ?? 0,
                prettyDuration(
                  Duration(seconds: result.from!.toInt()),
                  abbreviated: true,
                ),
              ),
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Roboto',
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}