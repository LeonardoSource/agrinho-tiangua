import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class InfoCity extends StatefulWidget {
  const InfoCity({super.key});

  @override
  State<InfoCity> createState() => _InfoCityState();
}

class _InfoCityState extends State<InfoCity> {
  String? localFilePath;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkAndLoad();
  }

  Future<void> _checkAndLoad() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isOffline = true;
      });
    }

    Directory dir = await getApplicationDocumentsDirectory();
    localFilePath = "${dir.path}/fotos.html";
  }

  Future<void> _saveHtmlWithResources(String html) async {
    if (localFilePath == null) return;

    Directory dir = await getApplicationDocumentsDirectory();
    String resourcesPath = "${dir.path}/resources";
    await Directory(resourcesPath).create(recursive: true);

    // Regex para pegar imagens, css e js
    final regex = RegExp(r'(src|href)="(https?:\/\/[^"]+)"');
    String newHtml = html.replaceAllMapped(regex, (match) {
      String url = match.group(2)!;
      String fileName = url.split('/').last.split('?').first;
      String localPath = "$resourcesPath/$fileName";

      // baixa e salva o recurso
      _downloadFile(url, localPath);

      return '${match.group(1)}="file://$localPath"';
    });

    final file = File(localFilePath!);
    await file.writeAsString(newHtml);
  }

  Future<void> _downloadFile(String url, String path) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final file = File(path);
        await file.writeAsBytes(response.bodyBytes);
      }
    } catch (e) {
      debugPrint("Erro ao baixar $url: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // PAra ter a opção de voltar
        appBar: AppBar(),
        // Corpo
        body: FutureBuilder(
          future: _checkAndLoad(),
          builder: (context, snapshot) {
            if (isOffline && localFilePath != null && File(localFilePath!).existsSync()) {
              // Carrega versão salva
              return InAppWebView(
                initialFile: localFilePath!,
              );
            } else {
              // Carrega online e salva tudo
              return InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(
                    Uri.parse('https://agrinhotiangua.wordpress.com/tiangua/'),
                  ),
                ),
                onLoadStop: (controller, url) async {
                  String? html = await controller.getHtml();
                  if (html != null) {
                    await _saveHtmlWithResources(html);
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
