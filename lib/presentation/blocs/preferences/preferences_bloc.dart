import 'package:bloc/bloc.dart';
import 'package:demo_app/presentation/blocs/preferences/preferences_event.dart';
import 'package:demo_app/presentation/blocs/preferences/preferences_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState>{
  @override
  PreferencesState get initialState => null;

  @override
  Stream<PreferencesState> mapEventToState(PreferencesEvent event) {
    return null;
  }

}