// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralInitial()) {
    on<GeneralEvent>((event, emit) {});
  }
}
