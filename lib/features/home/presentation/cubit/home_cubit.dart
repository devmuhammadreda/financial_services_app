import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class ProductsCubit extends Cubit<HomeState> {
  ProductsCubit() : super(HomeInitial());
}
