import 'package:callsystem/model.dart';
import 'package:callsystem/redux/actions.dart';
// import 'package:redux/redux.dart';

AppState inputNumReducer(AppState state, action){
  if (action is AddInputNum) {
    return AppState(
      inputNum: state.inputNum += action.inputNum,
      isButtonMove: action.isButtonMove,
      currentPage: action.currentPage
    );
  }

  if (action is ClearInputNum) {
    return AppState(
      inputNum: state.inputNum = '',
      isButtonMove: action.isButtonMove,
      currentPage: action.currentPage
    );
  }

  if (action is PrevHomePage) {
    return AppState(
      inputNum: state.inputNum = '',
      isButtonMove: state.isButtonMove = true,
      currentPage: state.currentPage = 0,
    );
  }

  return AppState(
    inputNum: state.inputNum,
    isButtonMove: state.isButtonMove,
    currentPage: state.currentPage
  );
}