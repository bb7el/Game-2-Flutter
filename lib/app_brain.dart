import 'questions.dart';

class AppBrain {
  int _questionNmber = 0;

  final List<Questions> _questiongroup = [
    Questions(
        questionText: 'عدد الكواكب في المجموعة الشمسية ثمانية',
        questionsImage: 'images/image-1.jpg',
        questionAnswer: true),
    Questions(
        questionText: 'القطط هي حيوانات لاحمة',
        questionsImage: 'images/image-2.jpg',
        questionAnswer: true),
    Questions(
        questionText: 'الصين موجودة في القارة القطبية',
        questionsImage: 'images/image-3.jpg',
        questionAnswer: false),
    Questions(
        questionText: 'الارض مسطحة وليست كروية',
        questionsImage: 'images/image-4.jpg',
        questionAnswer: false),
    Questions(
        questionText: 'باستطاعة الانسان العيش بدون اكل لحوم',
        questionsImage: 'images/image-5.jpg',
        questionAnswer: true),
    Questions(
        questionText: 'الشمس تدور حول الارض والارض تدور حول الشمس',
        questionsImage: 'images/image-6.jpg',
        questionAnswer: true),
    Questions(
        questionText: 'الحيوانات لا تشعر بالالم',
        questionsImage: 'images/image-7.jpg',
        questionAnswer: false),
  ];
  void nextQuestion() {
    if (_questionNmber < _questiongroup.length - 1) {
      _questionNmber++;
    }
  }

  String getQuestionByText() {
    return _questiongroup[_questionNmber].questionText ?? '';
  }

  String getQuestionImage() {
    return _questiongroup[_questionNmber].questionsImage ?? '';
  }

  bool getQuestionAnswer() {
    return _questiongroup[_questionNmber].questionAnswer!;
  }

  bool isFinished() {
    if (_questionNmber >= _questiongroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNmber = 0;
  }
}
