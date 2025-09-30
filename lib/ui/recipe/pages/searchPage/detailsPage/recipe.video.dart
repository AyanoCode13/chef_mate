import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
/// Stateful widget to fetch and then display video content.
class RecipeVideo extends StatefulWidget {
  final String _videoUrl;

  const RecipeVideo({super.key, required String videoUrl})
    : _videoUrl = videoUrl;

  @override
  _RecipeVideoState createState() => _RecipeVideoState();
}

class _RecipeVideoState extends State<RecipeVideo> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget._videoUrl))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.addListener(() {
      if (_controller.value.position >= _controller.value.duration) {
        // Video has ended
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Your video player here
        VideoPlayer(_controller),

        // Play/Pause button overlay
        Center(
          child: IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 50,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                  _isPlaying = false;
                } else {
                  _controller.play();
                  _isPlaying = true;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
