part of 'recomPage_cubit.dart';

abstract class SkinCareState {}

class SkinCareInitial extends SkinCareState {}

class SkinCareLoading extends SkinCareState {}

class SkinCareFileSelected extends SkinCareState {
  final File file;

  SkinCareFileSelected({required this.file});
}

class SkinCareResult extends SkinCareState {
  final String skinType;
  final String acneType;

  SkinCareResult({required this.skinType, required this.acneType});
}

class SkinCareError extends SkinCareState {
  final String message;

  SkinCareError({required this.message});
}

