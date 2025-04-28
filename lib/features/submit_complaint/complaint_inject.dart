import '../../injection_container.dart';
import 'presentation/cubit/submit_complaint_cubit.dart';

void initComplaintInjection() {
  sl.registerFactory(() => SubmitComplaintCubit());
}
