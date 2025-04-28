part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class BooksLoading extends ProductsState {}

class BooksLoadingMore extends ProductsState {
  final List<ResultsEntity> books;

  BooksLoadingMore({required this.books});
}

class BooksLoaded extends ProductsState {
  final List<ResultsEntity> books;
  final bool hasMorePages;
  final String? error;

  BooksLoaded({
    required this.books,
    required this.hasMorePages,
    this.error,
  });
}

class BooksError extends ProductsState {
  final String message;

  BooksError({required this.message});
}
