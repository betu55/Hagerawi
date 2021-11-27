import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_questions/bloc/admin_questions_event.dart';
import 'package:hagerawi_app/admin_questions/bloc/admin_questions_state.dart';
import 'package:hagerawi_app/admin_questions/model/admin_questions_model.dart';
import 'package:hagerawi_app/admin_questions/repository/admin_questions_repo.dart';

class AdminQuestionBloc extends Bloc<AdminQuestionEvent, AdminQuestionState> {
  AdminQuestionRepo questionRepo;
  AdminQuestionBloc(this.questionRepo) : super(AdminQuestionsNotLoaded());

  @override
  Stream<AdminQuestionState> mapEventToState(AdminQuestionEvent event) async* {
    if (event is PostQuestionEvent) {
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      final question = event.question;
      final choices = event.choices;
      final answers = event.answers;
      final imgUrl = event.imgUrl;

      yield QuestionsLoading();

      await Future.delayed(Duration(seconds: 15));

      try {
        AdminQuestionsModel theQuestion = await questionRepo.postQuestions(
            question, choices, answers, imgUrl);
        print("at the bloc");
        yield QuestionsLoaded(theQuestion.question, theQuestion.choices,
            theQuestion.answers, theQuestion.imgUrl);
      } catch (e) {
        print(e);
        yield UploadingFailed(errorMsg: e.toString());
      }
    }

    if (event is UpdateQuestionEvent) {
      final String id = event.id;
      try {
        AdminQuestionsModel theQuestion =
            await questionRepo.updateQuestions(id);

        yield QuestionOperationSuccess(theQuestion);
      } catch (e) {
        print(e);
        yield QuestionOperationFailed();
      }
    }

    if (event is DeleteQuestionEvent) {
      final String id = event.id;
      try {
        AdminQuestionsModel theQuestion =
            await questionRepo.deleteQuestions(id);

        yield QuestionOperationSuccess(theQuestion);
      } catch (e) {
        print(e);
        yield QuestionOperationFailed();
      }
    }
  }
}
