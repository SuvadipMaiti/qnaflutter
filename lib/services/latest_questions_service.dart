import 'package:qna/repository/repository.dart';

class LatestQuestionsService {
  Repository _repository;
  LatestQuestionsService(){
    _repository = Repository();
  }

  getLatestQuestions() async {
    return await _repository.httpGet('latest_questions');
  }
}