part of 'dogpage_cubit.dart';

@immutable
sealed class DogpageState {}

final class DogpageInitial extends DogpageState {}
final class Dogpageloaded extends DogpageState {
   final Welcome data;
   Dogpageloaded({required this.data});
}
final class DogpageError extends DogpageState {
  final String error;
  DogpageError({required this.error});

}
final class Dogpageloading extends DogpageState {}




