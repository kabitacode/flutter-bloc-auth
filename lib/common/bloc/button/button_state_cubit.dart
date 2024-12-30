import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/common/bloc/button/button_state.dart';
import 'package:flutter_bloc_login/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitState());

  void excute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try {
      Either result = await usecase.call(param: params);

      result.fold((error) {
        emit(ButtonFailedState(errorMessage: error));
      }, (data) {
        emit(ButtonSuccessState());
      });
    } catch (e) {
      ButtonFailedState(errorMessage: e.toString());
    }
  }
}
