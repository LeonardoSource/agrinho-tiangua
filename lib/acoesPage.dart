import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Acoes extends StatefulWidget {
  const Acoes({super.key});

  @override
  State<Acoes> createState() => _AcoesState();
}

class _AcoesState extends State<Acoes> {
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
                                    Uri.parse('https://agrinhotiangua.wordpress.com/fotos/'),
                                  ),
                                ),
                initialSettings: InAppWebViewSettings(
                  cacheEnabled: true,
                  clearCache: false,
                ),
              ),
              
            ],
          )


      );
  }
}