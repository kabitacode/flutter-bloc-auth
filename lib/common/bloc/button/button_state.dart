abstract class ButtonState {}

class ButtonInitState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailedState extends ButtonState {
  final String errorMessage;
  ButtonFailedState({required this.errorMessage});
}
