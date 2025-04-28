part of 'contact_us_cubit.dart';

abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {}

class ContactUsFailure extends ContactUsState {
  final String error;

  ContactUsFailure({required this.error});
}
