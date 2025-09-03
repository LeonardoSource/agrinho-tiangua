import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InfoDev extends StatelessWidget {
  const InfoDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Voltar"),),
      body: 
          
          Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                                  url: WebUri.uri(
                                    Uri.parse('https://leonardosource.github.io/sobre-mim/'),
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
