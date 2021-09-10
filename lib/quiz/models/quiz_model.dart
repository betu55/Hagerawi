class QuizModel {
  final imgUrl;
  final question;
  final choice;
  final answer;

  QuizModel({this.imgUrl, this.question, this.choice, this.answer});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
        imgUrl: json['imgUrl'],
        question: json['question'],
        choice: json['choices'],
        answer: json['answers']);
  }
}
