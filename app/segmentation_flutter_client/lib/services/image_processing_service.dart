import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../commons/const.dart';
import '../logger/logger.dart';

abstract class ImageProcessingService {
  Future<File> segmentRetinaVessels(File imageFile);
}

class ImageProcessingServiceImpl extends ImageProcessingService {
  final Logger _log = getLogger('SubscriptionsServiceImpl');

  @override
  Future<File> segmentRetinaVessels(File imageFile) async {
    // Set the URL of your Flask server's /segment/retina/vessels endpoint
    const String url = '$BASE_URL/segment/retina/vessels';

    // Create a FormData object to upload the image
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imageFile.path),
    });

    // Create a Dio instance with the responseType set to ResponseType.bytes
    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;

    // Send the request and receive the response
    Response response = await dio.post(url, data: formData);

    // Save the received mask to a file
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File maskFile = File('$tempPath/mask.png');
    await maskFile.writeAsBytes(response.data);

    return maskFile;
  }
}
