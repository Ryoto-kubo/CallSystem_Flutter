class InputNumState {
  String inputNum;
  bool isButtonMove;

  InputNumState({
    this.inputNum,
    this.isButtonMove,
  });

  InputNumState.initialState(): 
    inputNum = '',
    isButtonMove = false;
}