import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clish_bloc_event.dart';
part 'clish_bloc_state.dart';

class ClishBlocBloc extends Bloc<ClishBlocEvent, ClishBlocState> {
  ClishBlocBloc() : super(ClishBlocInitial()) {
    on<ClishBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
