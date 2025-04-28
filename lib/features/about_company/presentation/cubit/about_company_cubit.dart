import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'about_company_state.dart';

class AboutCompanyCubit extends Cubit<AboutCompanyState> {
  AboutCompanyCubit() : super(AboutCompanyInitial());
}
