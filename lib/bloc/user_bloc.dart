import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({"name": "-", "age": 0});

  void changeName(String paramName) {
    emit({
      "name": paramName,
      "age": state["age"],
    });
  }

  void changeAge(int paramAge) {
    emit({
      "name": state["name"],
      "age": paramAge,
    });
  }
}
