// To parse this JSON data, do
//
//     final signupRequest = signupRequestFromJson(jsonString);

import 'dart:convert';

SignupRequest signupRequestFromJson(String str) => SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
    SignupRequest({
        required this.name,
        required this.phoneNumber,
        required this.emailId,
        required this.password,
        required this.language,
        required this.state,
    });

    String name;
    String phoneNumber;
    String emailId;
    String password;
    String language;
    String state;

    factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        name: json["name"],
        phoneNumber: json["phone_number"],
        emailId: json["email_id"],
        password: json["password"],
        language: json["language"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "email_id": emailId,
        "password": password,
        "language": language,
        "state": state,
    };
}