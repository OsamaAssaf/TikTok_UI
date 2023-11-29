import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullVerticalScreenVideo extends StatefulWidget {
  const FullVerticalScreenVideo({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  FullVerticalScreenVideoState createState() => FullVerticalScreenVideoState();
}

class FullVerticalScreenVideoState extends State<FullVerticalScreenVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                child: VideoPlayer(_controller),
                onTap: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _isPlaying = false;
                      _controller.pause();
                    } else {
                      _isPlaying = true;
                      _controller.play();
                    }
                  });
                },
              ),
              Visibility(
                visible: !_isPlaying,
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: const VideoProgressColors(playedColor: Colors.white),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
