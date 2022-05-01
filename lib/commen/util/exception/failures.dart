import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final int? error;
  final String? message;
  const Failures({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];

  @override
  bool? get stringify => true;
}
