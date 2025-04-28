import 'package:financial_services_app/features/contact_us/data/repositories/contact_us_repo.dart';

import '../../injection_container.dart';
import 'data/datasources/contact_us_remote_datasource.dart';
import 'domain/repositories/contact_us_base_repo.dart';
import 'domain/usecases/send_email_usecase.dart';
import 'presentation/cubit/contact_us_cubit.dart';

void initContactUsInjection() {
  sl.registerFactory(() => ContactUsCubit(sendEmailUsecase: sl()));

  sl.registerLazySingleton<ContactUsBaseRepo>(() => ContactUsRepo(sl()));

  sl.registerLazySingleton<ContactUsRemoteBaseDataSource>(
    () => ContactUsRemoteDataSource(sl()),
  );

  sl.registerLazySingleton<SendEmailUsecase>(
      () => SendEmailUsecase(contactUsBaseRepo: sl()));
}
