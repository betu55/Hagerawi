class AdminQuestionsModel {
  //final imgUrl;
  final String question;
  final String choices;
  final String answers;
  final String imgUrl;

  AdminQuestionsModel(
      { //required this.imgUrl,
      required this.question,
      required this.choices,
      required this.answers,
      required this.imgUrl});

  factory AdminQuestionsModel.fromJson(Map<String, dynamic> json) {
    return AdminQuestionsModel(
      question: json['question'],
      choices: json['choices'],
      answers: json['answers'],
      imgUrl: json['imgUrl'],
    );
  }
}
