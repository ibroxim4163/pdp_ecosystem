import 'dart:convert';


import '../../../common/constants/api_constants.dart';
import '../../../common/models/token_model.dart';
import '../../../common/services/api_service.dart';
import '../models/sign_in_model.dart';

abstract class SignInRepository {
  Future<SignInModel> signUserIn(
    String username,
    String password,
  );

  Future<TokenModel> getToken(
    String username,
    String password,
  );
}

class SignInRepositoryImp implements SignInRepository {
  final APIService service;
  SignInRepositoryImp(this.service);

  @override
  Future<SignInModel> signUserIn(
    String username,
    String password,
  ) async {
    final String response = await service.request(
      ApiConst.postToken,
      method: Method.post,
    );

    final SignInModel signInModel = SignInModel.fromMap(jsonDecode(response));
    return signInModel;
  }

  @override
  Future<TokenModel> getToken(
    String username,
    String password,
  ) async {
    final header = {
      "Content-Type": "application/json",
    };
    Map<String, String> body = {
      "username": username,
      "password": password,
    };
    String response = "";
   
      response = await service.request(
        ApiConst.postToken,
        headers: header,
        body: jsonEncode(body),
        method: Method.post,
      );

      print("-=-=-=-=-=-=-=-=- debug");


    final TokenModel token = TokenModel.fromMap(jsonDecode(response));
    print("useruseruser=$token");

    return token;
  }
}
