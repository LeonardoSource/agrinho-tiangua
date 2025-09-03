import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InfoDev extends StatelessWidget {
  const InfoDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
