import 'package:callsystem/model.dart';
import 'package:callsystem/redux/actions.dart';
// import 'package:redux/redux.dart';

InputNumState inputNumReducer(InputNumState state, action){
  if (action is AddInputNum) {
    return InputNumState(
      inputNum: state.inputNum += action.inputNum,
      isButtonMove: action.isButtonMove,
    );
  }
  if (action is ClearInputNum) {
    return InputNumState(
      inputNum: state.inputNum = '',
      isButtonMove: action.isButtonMove,
    );
  }
  return InputNumState(inputNum: state.inputNum, isButtonMove: state.isButtonMove);
}