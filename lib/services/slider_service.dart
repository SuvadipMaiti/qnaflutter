import 'package:qna/repository/repository.dart';

class SliderService {
  Repository _repository;
  SliderService(){
    _repository = Repository();
  }

  getSliders() async {
    return await _repository.httpGet('slider');
  }
}