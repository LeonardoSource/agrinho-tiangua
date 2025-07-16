import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Memory extends StatefulWidget {
  const Memory({super.key});

  @override
  State<Memory> createState() => _AcoesState();
}

class _AcoesState extends State<Memory> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) { 
    return 
      Scaffold(
      
      body: 
          
          Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                                  url: WebUri.uri(
                                    Uri.parse('https://wordwall.net/pt/embed/485fd821a4464c3ab9e80ef99908124d?themeId=2&templateId=25&fontStackId=0'),
                                  ),
                                ),
                
                onLoadStart: (controller, url) {
                  setState(() {
                    _isLoading = true;
                  });
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
              if (_isLoading)
                const Center(
                  child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Aguarde....'),
                      ],
                    ),
                ),
            ],
          )
      );
  }
}