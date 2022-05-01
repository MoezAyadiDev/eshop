import 'package:eshop/commen/util/exception/failures.dart';

// ignore: constant_identifier_names
const INTERNET_FAILURE = InternetFailure(
  error: 555,
  message: 'Verify your internet',
);

class InternetFailure implements Failures {
  @override
  final int? error;
  @override
  final String? message;
  const InternetFailure({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];

  @override
  bool? get stringify => true;
}
