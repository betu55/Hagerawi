import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/quiz/bloc/blocs.dart';
import 'package:hagerawi_app/quiz/models/quiz_model.dart';
import 'package:hagerawi_app/quiz/repository/quiz_repo.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizRepo quizRepo;
  QuizBloc(this.quizRepo) : super(QuestionsLoading());

  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is FetchQuizEvent) {
      yield QuestionsLoading();
      await Future.delayed(Duration(seconds: 1));

      // yield NextQuestionLoading();
      // await Future.delayed(Duration(seconds: 1));
      try {
        List<QuizModel> questions = await quizRepo.getQuestions();
        yield QuestionsLoaded(questions);
      } catch (_) {
        yield QuestionsNotLoaded();
      }
    }
  }
}
