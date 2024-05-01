import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:learn_flutter_app/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.data});
  final Map data;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late YoutubePlayerController _controller;
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    // --- YoutubePlayer controller
    _controller = YoutubePlayerController(
      initialVideoId: widget.data["youtube_id"],
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    // --- Code controller
    final code = widget.data["code"];
    _codeController = CodeController(
      text: code,
      language: dart,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- AppBar ----
      appBar: AppBar(
          title: Text(widget.data["name"]),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white),
      backgroundColor: backgroundColor,
      // ---- Body ----
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Youtube Video
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              const SizedBox(height: 30),

              // ---- Description
              const Text(
                "الوصف",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              Text(
                widget.data["description"],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              // ---- Dart Code Example
              const Text(
                "مثال",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              const SizedBox(height: 8),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CodeTheme(
                  data: const CodeThemeData(styles: monokaiSublimeTheme),
                  child: CodeField(
                    controller: _codeController!,
                    textStyle: GoogleFonts.sourceCodePro(),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // ---- Button to open a URL
              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(widget.data["url"]));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: Size(MediaQuery.of(context).size.width, 45)),
                child: const Text(
                  "إقرأ المزيد",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
