import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel(
      {required this.success,
      required this.statusCode,
      required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorMessageModel(
      success: jsonData['success'],
      statusCode: jsonData['status_code'],
      statusMessage: jsonData['status_message'],
    );
  }

  @override
  List<Object?> get props => [
        success,
        statusCode,
        statusMessage,
      ];
}
