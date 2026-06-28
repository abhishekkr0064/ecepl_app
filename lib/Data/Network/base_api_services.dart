abstract class BaseApiServices {
  // Get APIs
  Future<dynamic> getApi(String url, {Map<String, String>? headers});

  // Post APIs
  Future<dynamic> postApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  });

  // Put or Update APIs
  Future<dynamic> putJsonApi(
    String url,
    dynamic data, {
    Map<String, String>? headers,
  });

  ///For file upload
  // Future<dynamic> putApi(
  //   String url, {
  //   required List<File> files,
  //   required String fileKey,
  //   Map<String, String>? fields,
  //   Map<String, String>? headers,
  // });

  // Delete APIs
  Future<dynamic> deleteApi(String url, {Map<String, String>? headers});

  // Future<dynamic> multipartPostApi(
  //   String url, {
  //   required List<File> files,
  //   required String fileKey,
  //   Map<String, String>? fields,
  //   Map<String, String>? headers,
  // });
}
