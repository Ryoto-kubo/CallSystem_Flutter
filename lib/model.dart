class AppState {
  String inputNum;
  bool isButtonMove;
  int currentPage;

  AppState({
    this.inputNum,
    this.isButtonMove,
    this.currentPage,
  });

  AppState.initialState(): 
    inputNum = '',
    isButtonMove = false,
    currentPage = 0;
}