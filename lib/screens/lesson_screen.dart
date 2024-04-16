import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
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
    // --- YoutubePlayer
    _controller = YoutubePlayerController(
      initialVideoId: widget.data["youtube_id"],
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    // --- code controller
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
      appBar: AppBar(
          title: Text(widget.data["name"]),
          backgroundColor: const Color(0xff48a1bd),
          foregroundColor: Colors.white),
      backgroundColor: const Color.fromARGB(255, 228, 239, 243),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "الوصف",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff48a1bd)),
              ),
              Text(
                widget.data["description"],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "مثال",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff48a1bd)),
              ),
              const SizedBox(
                height: 8,
              ),
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
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(widget.data["url"]));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff48a1bd),
                    fixedSize: Size(MediaQuery.of(context).size.width, 45)),
                child: const Text(
                  "إقرأ المزيد",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
