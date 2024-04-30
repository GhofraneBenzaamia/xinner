import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MediaDisplayWidget extends StatelessWidget {
  final String mediaUrl;
  final String fileName;
  const MediaDisplayWidget(
      {Key? key, required this.mediaUrl, required this.fileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("File name" + fileName);
    print("media url" + mediaUrl);
    return FutureBuilder(
      future: determineMediaType(fileName),
      builder: (context, AsyncSnapshot<MediaType> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final mediaType = snapshot.data!;
          print(mediaType);
          switch (mediaType) {
            case MediaType.image:
              return CachedNetworkImage(
                imageUrl: mediaUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            case MediaType.pdf:
              return PDFView(
                filePath: mediaUrl,
              );
            default:
              return Text('Unsupported media type');
          }
        }
      },
    );
  }

  Future<MediaType> determineMediaType(String url) async {
    // Assume that if the URL ends with .pdf, it's a PDF, otherwise, it's an image
    if (url.endsWith('.pdf')) {
      return MediaType.pdf;
    } else {
      // For simplicity, we're assuming any other URL is an image
      return MediaType.image;
    }
  }
}

enum MediaType {
  image,
  pdf,
}
