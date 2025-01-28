part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetSalonsLoading extends HomeState {}

final class GetSalonsSuccess extends HomeState {
}

final class GetSalonsError extends HomeState {
  final String? error;
  GetSalonsError({this.error});
}
final class GetOneSalonsLoading extends HomeState {}

final class GetOneSalonsSuccess extends HomeState {
  final SalonModel? salon;
  GetOneSalonsSuccess({this.salon});
}

final class GetOneSalonsError extends HomeState {
  final String? error;
  GetOneSalonsError({this.error});
}

class GetServicesLoading extends HomeState {}

class GetServicesSuccess extends HomeState {}

class GetServicesError extends HomeState {
  final String? error;
  GetServicesError({this.error});
}