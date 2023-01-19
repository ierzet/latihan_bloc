import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc() : super(true);
  changeTheme() => emit(!state);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);

    print(change);
  }
}
