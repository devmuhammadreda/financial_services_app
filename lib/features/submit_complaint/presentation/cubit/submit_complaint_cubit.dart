import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'submit_complaint_state.dart';

class SubmitComplaintCubit extends Cubit<SubmitComplaintState> {
  SubmitComplaintCubit() : super(SubmitComplaintInitial());
}
