class _response {
  late final String fileName;
  late final String answerText;
  late final int keywordsInText;
  late final int keywordsDetected;
  late final List<String> keywords;

  _response(
      {required this.fileName,
      required this.answerText,
      required this.keywordsInText,
      required this.keywordsDetected,
      required this.keywords});

  List<_response> jsonToMap(Map<String, Map<dynamic, dynamic>> json) {
    List<_response> response = [];
    json.forEach((key, value) {
      _response newres = _response(
          fileName: key,
          answerText: value['answerText'],
          keywordsInText: value['keywordsInText'],
          keywordsDetected: value['keywordsDetected'],
          keywords: value['keywords']);
        response.add(newres);
    });
    return response;
  }

  List<_response> getDetails() {
    List<_response> response = [];
    for(int i=0;i<5;i++) {
      _response newres = _response(
          fileName: "File# $i",
          answerText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          keywordsDetected: 20 + i,
          keywordsInText : 15 + i,
          keywords: ["hello$i", " hey$i" , "how you doing$i"]);
      response.add(newres);
    }
    return response;
  }


}
